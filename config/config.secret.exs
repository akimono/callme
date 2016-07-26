use Mix.Config

config :callmemd,
       mailgun_domain: "https://callmemd.com",
       mailgun_key: "key-0aac767d8bc24b174c9e3272f0ec700d"
 config :ex_aws,
      access_key_id: "AKIAIVCOAPOOIW5EB4FA",
      secret_access_key: "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",
        region: "us-west-2",
  s3: [
    scheme: "https://",
    host: "s3.amazonaws.com",
    region: "us-west-2"
  ]