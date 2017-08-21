module JobsHelper
  def job_levels
    Job.levels.collect { |key, value| [key, value] }
  end
end
