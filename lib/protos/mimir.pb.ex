defmodule Cortexpb.WriteRequest.SourceEnum do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :API, 0
  field :RULE, 1
end
defmodule Cortexpb.MetricMetadata.MetricType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN, 0
  field :COUNTER, 1
  field :GAUGE, 2
  field :HISTOGRAM, 3
  field :GAUGEHISTOGRAM, 4
  field :SUMMARY, 5
  field :INFO, 6
  field :STATESET, 7
end
defmodule Cortexpb.Histogram.ResetHint do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :UNKNOWN, 0
  field :YES, 1
  field :NO, 2
  field :GAUGE, 3
end
defmodule Cortexpb.QueryResponse.Status do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :ERROR, 0
  field :SUCCESS, 1
end
defmodule Cortexpb.QueryResponse.ErrorType do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :NONE, 0
  field :TIMEOUT, 1
  field :CANCELED, 2
  field :EXECUTION, 3
  field :BAD_DATA, 4
  field :INTERNAL, 5
  field :UNAVAILABLE, 6
  field :NOT_FOUND, 7
end
defmodule Cortexpb.WriteRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :timeseries, 1, repeated: true, type: Cortexpb.TimeSeries, deprecated: false
  field :Source, 2, type: Cortexpb.WriteRequest.SourceEnum, enum: true
  field :metadata, 3, repeated: true, type: Cortexpb.MetricMetadata, deprecated: false
  field :skip_label_name_validation, 1000, type: :bool, json_name: "skipLabelNameValidation"
end
defmodule Cortexpb.WriteResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3
end
defmodule Cortexpb.TimeSeries do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :labels, 1, repeated: true, type: Cortexpb.LabelPair, deprecated: false
  field :samples, 2, repeated: true, type: Cortexpb.Sample, deprecated: false
  field :exemplars, 3, repeated: true, type: Cortexpb.Exemplar, deprecated: false
  field :histograms, 4, repeated: true, type: Cortexpb.Histogram, deprecated: false
end
defmodule Cortexpb.LabelPair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :name, 1, type: :bytes
  field :value, 2, type: :bytes
end
defmodule Cortexpb.Sample do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :timestamp_ms, 2, type: :int64, json_name: "timestampMs"
  field :value, 1, type: :double
end
defmodule Cortexpb.MetricMetadata do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :type, 1, type: Cortexpb.MetricMetadata.MetricType, enum: true
  field :metric_family_name, 2, type: :string, json_name: "metricFamilyName"
  field :help, 4, type: :string
  field :unit, 5, type: :string
end
defmodule Cortexpb.Metric do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :labels, 1, repeated: true, type: Cortexpb.LabelPair, deprecated: false
end
defmodule Cortexpb.Exemplar do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :labels, 1, repeated: true, type: Cortexpb.LabelPair, deprecated: false
  field :value, 2, type: :double
  field :timestamp_ms, 3, type: :int64, json_name: "timestampMs"
end
defmodule Cortexpb.Histogram do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof :count, 0
  oneof :zero_count, 1

  field :count_int, 1, type: :uint64, json_name: "countInt", oneof: 0
  field :count_float, 2, type: :double, json_name: "countFloat", oneof: 0
  field :sum, 3, type: :double
  field :schema, 4, type: :sint32
  field :zero_threshold, 5, type: :double, json_name: "zeroThreshold"
  field :zero_count_int, 6, type: :uint64, json_name: "zeroCountInt", oneof: 1
  field :zero_count_float, 7, type: :double, json_name: "zeroCountFloat", oneof: 1

  field :negative_spans, 8,
    repeated: true,
    type: Cortexpb.BucketSpan,
    json_name: "negativeSpans",
    deprecated: false

  field :negative_deltas, 9, repeated: true, type: :sint64, json_name: "negativeDeltas"
  field :negative_counts, 10, repeated: true, type: :double, json_name: "negativeCounts"

  field :positive_spans, 11,
    repeated: true,
    type: Cortexpb.BucketSpan,
    json_name: "positiveSpans",
    deprecated: false

  field :positive_deltas, 12, repeated: true, type: :sint64, json_name: "positiveDeltas"
  field :positive_counts, 13, repeated: true, type: :double, json_name: "positiveCounts"
  field :reset_hint, 14, type: Cortexpb.Histogram.ResetHint, json_name: "resetHint", enum: true
  field :timestamp, 15, type: :int64
end
defmodule Cortexpb.FloatHistogram do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :count_float, 2, type: :double, json_name: "countFloat"
  field :sum, 3, type: :double
  field :schema, 4, type: :sint32
  field :zero_threshold, 5, type: :double, json_name: "zeroThreshold"
  field :zero_count_float, 7, type: :double, json_name: "zeroCountFloat"

  field :negative_spans, 8,
    repeated: true,
    type: Cortexpb.BucketSpan,
    json_name: "negativeSpans",
    deprecated: false

  field :negative_counts, 10, repeated: true, type: :double, json_name: "negativeCounts"

  field :positive_spans, 11,
    repeated: true,
    type: Cortexpb.BucketSpan,
    json_name: "positiveSpans",
    deprecated: false

  field :positive_counts, 13, repeated: true, type: :double, json_name: "positiveCounts"
  field :reset_hint, 14, type: Cortexpb.Histogram.ResetHint, json_name: "resetHint", enum: true
  field :timestamp, 15, type: :int64
end
defmodule Cortexpb.BucketSpan do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :offset, 1, type: :sint32
  field :length, 2, type: :uint32
end
defmodule Cortexpb.SampleHistogram do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :count, 1, type: :double
  field :sum, 2, type: :double
  field :buckets, 3, repeated: true, type: Cortexpb.HistogramBucket
end
defmodule Cortexpb.HistogramBucket do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :boundaries, 1, type: :int32
  field :lower, 2, type: :double
  field :upper, 3, type: :double
  field :count, 4, type: :double
end
defmodule Cortexpb.SampleHistogramPair do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :timestamp, 2, type: :int64
  field :histogram, 1, type: Cortexpb.SampleHistogram
end
defmodule Cortexpb.QueryResponse do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  oneof :data, 0

  field :status, 1, type: Cortexpb.QueryResponse.Status, enum: true
  field :error_type, 2, type: Cortexpb.QueryResponse.ErrorType, json_name: "errorType", enum: true
  field :error, 3, type: :string
  field :string, 4, type: Cortexpb.StringData, oneof: 0
  field :vector, 5, type: Cortexpb.VectorData, oneof: 0
  field :scalar, 6, type: Cortexpb.ScalarData, oneof: 0
  field :matrix, 7, type: Cortexpb.MatrixData, oneof: 0
end
defmodule Cortexpb.StringData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :value, 1, type: :string
  field :timestamp_milliseconds, 2, type: :int64, json_name: "timestampMilliseconds"
end
defmodule Cortexpb.VectorData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :samples, 1, repeated: true, type: Cortexpb.VectorSample, deprecated: false
  field :histograms, 2, repeated: true, type: Cortexpb.VectorHistogram, deprecated: false
end
defmodule Cortexpb.VectorSample do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :metric, 1, repeated: true, type: :string
  field :value, 2, type: :double
  field :timestamp_milliseconds, 3, type: :int64, json_name: "timestampMilliseconds"
end
defmodule Cortexpb.VectorHistogram do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :metric, 1, repeated: true, type: :string
  field :histogram, 2, type: Cortexpb.FloatHistogram, deprecated: false
end
defmodule Cortexpb.ScalarData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :value, 1, type: :double
  field :timestamp_milliseconds, 2, type: :int64, json_name: "timestampMilliseconds"
end
defmodule Cortexpb.MatrixData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :series, 1, repeated: true, type: Cortexpb.MatrixSeries, deprecated: false
end
defmodule Cortexpb.MatrixSeries do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :metric, 1, repeated: true, type: :string
  field :samples, 2, repeated: true, type: Cortexpb.MatrixSample, deprecated: false
  field :histograms, 3, repeated: true, type: Cortexpb.FloatHistogram, deprecated: false
end
defmodule Cortexpb.MatrixSample do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.10.0", syntax: :proto3

  field :value, 1, type: :double
  field :timestamp_milliseconds, 2, type: :int64, json_name: "timestampMilliseconds"
end
