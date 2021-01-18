resource "google_monitoring_dashboard" "https_lb_dashboard" {
  project = var.project
  count=var.https_lb_dashboard_enable ? 1: 0
  dashboard_json = <<EOF

{
  "displayName": "${var.https_lb_dashboard_name}",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Request Count",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Total Latency",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_PERCENTILE_99"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/total_latencies\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Request Bytes",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_bytes_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "By"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Response Bytes",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/response_bytes_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "By"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Frontend RTT [95/50/5 PERCENTILE].",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_95",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/frontend_tcp_rtt\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            },
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_05",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_PERCENTILE_99"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/frontend_tcp_rtt\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            },
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_50",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/frontend_tcp_rtt\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Backend Request Count",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_request_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Backend Request Bytes",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_request_bytes_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "By"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Backend Response Bytes",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_response_bytes_count\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "By"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Backend Latency",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_95",
                    "groupByFields": [
                      "resource.label.\"url_map_name\""
                    ],
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_latencies\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            },
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_05",
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_latencies\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            },
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "crossSeriesReducer": "REDUCE_PERCENTILE_50",
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"loadbalancing.googleapis.com/https/backend_latencies\" resource.type=\"https_lb_rule\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "ms"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}


EOF
}