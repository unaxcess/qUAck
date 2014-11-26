class UA2Quack < FPM::Cookery::Recipe

    source      'nothing', :with => :noop
    name        'ua2-qUAck'
    description 'UA Server'
    maintainer  'Jon Topper <jon@scalefactory.com>'
    vendor      'fpm'
    version     '1.1'

    if ENV.has_key?('PKG_REVISION')
        revision ENV['PKG_REVISION']
    else
        raise 'No PKG_REVISION passed in the environment'
    end

    def build
        Dir.chdir "#{workdir}" do
            safesystem("dos2unix configure.sh")
	    safesystem("./configure.sh")
            safesystem("make clean")
            safesystem("make all")
        end
    end

    def install
        bin.install [ "#{workdir}/bin/qUAck", "#{workdir}/bin/qUAckd" ]
    end

end
