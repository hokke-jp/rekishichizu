ActionMailer::Base.add_delivery_method :ses,
                                       AWS::SES::Base,
                                       access_key_id: ENV['AWS_ACCESS_KEY'],
                                       secret_access_key: ENV['AWS_SECRET_KEY'],
                                       server: 'email.ap-northeast-1.amazonaws.com'