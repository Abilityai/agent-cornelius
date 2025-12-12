# KindCoin Technical Specification
## Dopamine-Optimized Compassion Platform

### Core Architecture

#### Reward Algorithm (The Dopamine Engine)

```
BASELINE_REWARD_PROBABILITY = 0.4  # 40% chance of reward
VARIABLE_MULTIPLIER = random(0.5, 3.0)  # Unpredictability factor

def calculate_reward(kindness_act):
    base_points = assess_effort_level(kindness_act)

    # Intermittent Variable Reinforcement Schedule
    if random() < BASELINE_REWARD_PROBABILITY:
        reward = base_points * VARIABLE_MULTIPLIER

        # Rare jackpots (0.5% chance)
        if random() < 0.005:
            reward *= 100  # Massive dopamine spike
            trigger_social_amplification(kindness_act)

        return reward
    else:
        return 0  # No reward (maintains uncertainty)

def assess_effort_level(act):
    # Higher effort = higher base reward
    factors = {
        'time_invested': act.duration_minutes,
        'personal_cost': act.monetary_value + act.opportunity_cost,
        'social_risk': act.vulnerability_level,
        'creativity': act.uniqueness_score,
        'impact': act.beneficiaries_count
    }
    return weighted_sum(factors)
```

#### Streak Mechanics (Loss Aversion Activation)

```
class CompassionStreak:
    def __init__(self, user):
        self.current_streak = 0
        self.best_streak = 0
        self.streak_saves = 3  # Forgiveness tokens

    def daily_check(self):
        if kindness_act_today():
            self.current_streak += 1

            # Milestone rewards (dopamine at predictable intervals)
            if self.current_streak in [7, 30, 100, 365]:
                deliver_milestone_reward()

        else:
            if self.streak_saves > 0:
                send_notification("⚠️ Save your streak! Do one kind act in next hour")
                self.streak_saves -= 1
            else:
                self.streak_broken()  # Painful loss (negative dopamine)

    def streak_broken(self):
        # Make the loss visceral
        show_animation(self.current_streak, "shattering")
        play_sound("streak_break.wav")  # Auditory pain association
        self.current_streak = 0
```

#### Social Proof Layer

```
class SocialAmplification:
    def broadcast_kindness(self, act, user):
        # Selective broadcasting (not every act, maintains special feeling)
        if act.score > threshold or random() < 0.1:

            # Geographic proximity boost
            nearby_users = get_users_within_radius(user.location, km=5)
            for nearby_user in nearby_users:
                notify(f"{user.name} just {act.description} nearby!")

            # Social network propagation
            for friend in user.friends:
                if friend.engagement_score > 0.7:  # Only to engaged users
                    update_friend_feed(friend, act)

            # Workplace/School leaderboards
            update_leaderboard(user.group, act)

    def create_kindness_pressure(self):
        # Subtle social pressure through visibility
        show_message("3 of your friends helped someone today")
        show_heatmap("Kindness activity in your neighborhood")
```

### Neurohacking Features

#### 1. Anticipation Maximizer

**The "Kindness Lottery Ticket"**
- Each act generates encrypted "ticket"
- Drawing happens at random intervals (not daily - unpredictable)
- User can check ticket anytime (repeated checking = dopamine)
- Most tickets lose, some win small, rarely win big

```python
def generate_lottery_ticket(kindness_act):
    ticket = {
        'id': generate_uuid(),
        'encrypted_result': encrypt(calculate_win()),
        'reveal_time': now() + random_hours(1, 72),
        'check_count': 0
    }

    # Each check increases anticipation
    def check_ticket():
        ticket.check_count += 1
        if now() < ticket.reveal_time:
            return "Still pending... check back soon!"  # Anticipation loop
        else:
            return decrypt(ticket.encrypted_result)
```

#### 2. Uncertainty Optimizer

**Variable Timing Rewards**
- Rewards arrive 1 minute to 48 hours after act
- User never knows when payoff comes
- Creates constant background anticipation

**Mystery Multipliers**
- Some days are secretly "2x kindness points" days
- Users discover only AFTER acting kind
- Creates "I wonder if today is special" checking behavior

#### 3. Near-Miss Engineering

```python
def create_near_miss_experience():
    # Occasionally show "almost won big!"
    if random() < 0.15:  # 15% near-miss rate
        show_animation("spinner", final_position="one_slot_from_jackpot")
        message("So close! Your next act might be the big one...")
        # Near-misses paradoxically increase motivation more than small wins
```

### Behavioral Triggers

#### Environmental Cues

```python
class ContextualTriggers:
    def __init__(self):
        self.location_triggers = {
            'coffee_shop': "Someone's coffee is waiting to be paid forward",
            'subway': "A tired commuter needs your seat",
            'grocery': "Someone's struggling with heavy bags",
            'office': "A colleague needs recognition"
        }

    def detect_opportunity(self, user_location):
        if user_location.type in self.location_triggers:
            if user.recent_kindness_gap() > hours(8):
                subtle_notification(self.location_triggers[user_location.type])

    def time_based_triggers(self):
        # Peak kindness hours (lunch, after work)
        if current_hour() in [12, 17, 19]:
            prompt_gentle_reminder()
```

#### Cognitive Load Reduction

```python
def simplify_kindness():
    # Remove decision fatigue
    daily_suggestion = {
        'Monday': "Compliment a stranger",
        'Tuesday': "Help someone with directions",
        'Wednesday': "Share your expertise freely",
        'Thursday': "Listen without interrupting",
        'Friday': "Buy someone's coffee",
        'Weekend': "Volunteer 15 minutes online"
    }

    # One-tap kindness
    quick_acts = [
        "Smiled at someone",
        "Held door open",
        "Let someone go first",
        "Picked up litter",
        "Gave genuine compliment"
    ]

    # Pre-populated, just tap to confirm
    return one_tap_options(quick_acts)
```

### Anti-Gaming Measures

```python
class AuthenticityEngine:
    def verify_kindness(self, act):
        # Prevent fake kindness farming

        # Pattern detection
        if user.acts_similar_pattern():
            reduce_rewards_temporarily()

        # Velocity limits
        if user.acts_per_hour > 5:
            flag_for_review()

        # Recipient confirmation (random sampling)
        if random() < 0.1:
            request_recipient_confirmation()

        # AI sentiment analysis on descriptions
        if description_seems_fake(act.description):
            require_photo_evidence()

        # Community validation
        if act.points > high_threshold:
            require_peer_validation(minimum_validators=3)
```

### Measurement & Analytics

```python
class SpiritualMetrics:
    def __init__(self):
        self.metrics = {
            'kindness_velocity': acts_per_day,
            'compassion_radius': unique_beneficiaries,
            'empathy_depth': average_effort_score,
            'viral_coefficient': acts_inspired_in_others,
            'sustained_practice': streak_consistency,
            'transformation_index': before_after_wellbeing_delta
        }

    def calculate_city_kindness_index(city):
        return {
            'acts_per_capita': total_acts / population,
            'participation_rate': active_users / population,
            'kindness_density': acts_per_square_km,
            'reciprocity_rate': mutual_help_connections,
            'mood_improvement': aggregate_happiness_scores
        }
```

### Privacy & Ethics Layer

```python
class EthicalSafeguards:
    def __init__(self):
        self.principles = [
            "No public shaming for non-participation",
            "No selling of kindness data",
            "Opt-out always available",
            "No manipulation of vulnerable populations",
            "Transparent about dopamine mechanisms",
            "Open source core algorithms"
        ]

    def check_ethical_compliance(feature):
        for principle in self.principles:
            if violates(feature, principle):
                raise EthicalViolation(principle)

    def user_autonomy_protection():
        # Regular prompts to reflect
        if user.days_active % 30 == 0:
            prompt("Is KindCoin helping you be more compassionate?")
            offer_settings_adjustment()
            remind_opt_out_option()
```

### Launch Strategy

#### Pilot Cities Selection
1. **San Francisco** - Tech early adopters
2. **Portland** - Progressive culture
3. **Austin** - Innovation + community focus

#### Initial User Acquisition
- Partner with local coffee shops (QR codes on cups)
- University campus launches (students as vectors)
- Corporate wellness programs (productivity angle)
- Parent groups (teach kids kindness)

#### Viral Mechanics
- Invite rewards (both inviter and invitee get bonuses)
- Group challenges (offices, schools compete)
- City vs. city competitions
- Celebrity endorsements (authentic users only)

---

## The Dopamine Schedule That Creates Compassion Addiction

### Week 1-2: Hook Formation
- High reward probability (60%) to establish behavior
- Immediate rewards to create association
- Simple acts to reduce friction

### Week 3-8: Variable Schedule Introduction
- Reduce reward probability to 40%
- Introduce delays (reward arrives hours/days later)
- Add surprise multipliers

### Week 9+: Addiction Maintenance
- Full variable ratio schedule
- Rare massive rewards
- Social competition elements
- Streak pressure intensifies

### Month 6+: Habit Solidification
- Behavior continues even without app
- Kindness becomes identity ("I'm someone who helps")
- Natural oxytocin/serotonin rewards take over
- App becomes optional (success!)

---

*"We're engineering addiction to compassion using the same neural hijacking that makes people check Instagram 150 times a day. The difference is the outcome: instead of depression and division, we get connection and wellbeing. The ends, in this case, justify the means."*