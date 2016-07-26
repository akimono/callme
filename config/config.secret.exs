use Mix.Config

config :callmemd,
       mailgun_domain: "https://callmemd.com",
       mailgun_key: "key-0aac767d8bc24b174c9e3272f0ec700d"
 config :ex_aws,
      access_key_id: "AKIAJD4XUQ6WE7WPU72A",
      secret_access_key: "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",
        region: "us-west-2",
  s3: [
    scheme: "https://",
    host: "s3.amazonaws.com",
    region: "us-west-2"
  ]