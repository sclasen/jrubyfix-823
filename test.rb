require 'openssl'

    CERT_ARMOR_REGEX = 
      /(-----BEGIN (X509 )?CERTIFICATE-----.+?-----END (X509 )?CERTIFICATE-----)/m


    def chain(encoded)
      encoded.scan(CERT_ARMOR_REGEX).map(&:first).map do |cert|
        OpenSSL::X509::Certificate.new(cert)
      end
    end



ca_pem =  File.read("ca_certs.pem") 
chain(ca_pem)
