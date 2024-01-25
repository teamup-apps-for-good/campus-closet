# frozen_string_literal: true

json.array! @conditions, partial: 'conditions/condition', as: :condition
