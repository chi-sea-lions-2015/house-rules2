FactoryGirl.define do

  factory :chore do
    task "do dishes"
    house
  end

  factory :chore_log do
    user
    chore

    factory :chores_with_logs do
      transient do
        chore_count 2
      end
      after(:create) do |chore_log, evaluator|
        create_list(:chore_log, evaluator.chore_count, chore: chore)
      end
    end
  end

  factory :chore_issue, class: "Issue" do
    association :issuable, :factory => :chore
    reason "I hate Paul!"
    user
  end

  factory :chore_promise, class: "UserPromise" do
    association :promisable, :factory => :chore
    user
  end

  #### Chore End
  factory :event do
    name "halloween"
    date "2013-09-12 22:49:27"
    description "Costume party!!"
    housing_assignment
  end


  factory :event_issue, class: "Issue" do
    association :issuable, :factory => :event
    reason "I hate halloween"
    user
  end

  #EVENT END
  factory :communal_item do
    name "toilet paper"
    house
    stock_level "low"
  end

  factory :item_issue, class: "Issue" do
    association :issuable, :factory => :communal_item
    reason "I hate toilet paper"
    user
  end

  factory :communal_item_promise, class: "UserPromise" do
    association :promisable, :factory => :communal_item
    user
  end

  ## Communal Item End

  factory :messages do
    content "you're the best"
    housing_assignment
  end

  # Message End

  factory :rule do
    content "Flush the toilet"
    housing_assignment
  end

  factory :rule_issue, class: "Issue" do
    association :issuable, :factory => :rule
    reason "I hate flushing!"
    user
  end

  # Rule End

  factory :housing_assignment do
    user
    house
  end

  factory :house do
    name "The hater house"
    property_manager

    factory :house_with_housing_assignments do
      transient do
        housing_assignment_count 2
      end

      factory :house_with_chores do
        transient do
          house_chores_count 2
        end

        factory :house_with_communal_items do
          transient do
            house_items_count 2
          end

          after(:create) do |house, evaluator|
            create_list(:housing_assignment, evaluator.housing_assignment_count, house: house)
            create_list(:chore, evaluator.house_chores_count, house: house)
            create_list(:communal_item, evaluator.house_items_count, house: house)
          end
        end
      end
    end
  end

  factory :property_manager do
    name "Tom"
    phone "773-606-6186"
    email "tom@tom.com"

    factory :property_manager_with_houses do
      transient do
        manager_house_count 1
      end
    end
  end


  factory :manager_address, class: "Address" do
    association :addressable, :factory => :property_manager
    street "1462 W Carmen Ave Apt 2"
    city "Chicago"
    state "IL"
    zip_code "60640"
  end

  factory :house_address, class: "Address" do
    association :addressable, :factory => :house
    street "111 W State St."
    city "Chicago"
    state "IL"
    zip_code "60640"
  end


  factory :user do
    first_name "Paul"
    last_name "Clegg"
    email "paul@paul.com"
    password "123456"

    factory :user_chore_logs do
      transient do
        chore_log_count 2
      end

      factory :user_chore_issues do
        transient do
          chore_issue_count 2
        end

        factory :user_chore_promise do
          transient do
            chore_promise_count 2
          end

          factory :user_event_issues do
            transient do
              event_issue_count 2
            end

            factory :user_item_issues do
              transient do
                item_issue_count 2
              end

              factory :user_item_promises do
                transient do
                  item_promise_count 2
                end

                factory :user_rule_issues do
                  transient do
                    rule_issue_count 2
                  end

                  factory :user_housing_ass do
                    transient do
                      house_ass_count 2
                    end

                    after(:create) do |user, evaluator|
                      create_list(:chore_log, evaluator.chore_log_count, user: user)
                      create_list(:chore_issue, evaluator.chore_issue_count, user: user)
                      create_list(:chore_promise, evaluator.chore_promise_count, user: user)
                      create_list(:event_issue, evaluator.event_issue_count, user: user)
                      create_list(:item_issue, evaluator.item_issue_count, user: user)
                      create_list(:communal_item_promise, evaluator.item_promise_count, user: user)
                      create_list(:rule_issue, evaluator.rule_issue_count, user: user)
                      create_list(:housing_assignment, evaluator.housing_ass_count, user: user)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

#User Factories
# :chore_log
# :chore_issue
# :chore_promise
# :event_issue
# :item_issue
# :communal_item_promise
# :rule_issue
# :housing_assignment
