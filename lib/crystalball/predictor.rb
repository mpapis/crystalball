module Crystalball
  class Predictor
    attr_reader :map, :diff

    def initialize(map, source_diff)
      @map = map
      @diff = source_diff
    end

    def cases
      map.map do |case_uid, case_map|
        case_uid if diff.any? { |file| file.relative_path.in?(case_map) }
      end.compact
    end
  end
end
