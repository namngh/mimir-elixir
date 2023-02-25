defmodule Mimir.Metric.Counter do
  defstruct name: nil, help: "", unit: nil

  def new(name, opts \\ []) do
    %__MODULE__{name: name, help: opts[:help], unit: opts[:unit]}
  end

  def send(%__MODULE__{name: name, help: help, unit: unit}, value) do
    Cortexpb.WriteRequest.new!(
      timeseries: [
        Cortexpb.TimeSeries.new!(lables: [Cortexpb.LabelPair.new!(name: name, value: value)])
      ],
      metadata: [
        Cortexpb.MetricMetadata.new!(
          type: Cortexpb.MetricMetadata.MetricType.COUNTER,
          metric_family_name: name,
          help: help,
          unit: unit
        )
      ]
    )
  end
end
