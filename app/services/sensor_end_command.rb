class SensorEndCommand

  class < self

    def change_update_frequency(seconds: 600)
      # send [3G*8800000015*0009*UPLOAD,60]
      # expect response [3G*8800000015*0006*UPLOAD]
      # format spec: [company, device id, length of content, content]
      
    end

    def set_ec_number(phone_number)
      # [3G*8800000015*0012*CENTER,00000000000]
      # [3G*8800000015*0006*CENTER]
      
    end

    # Any number, expecting ec number, can control the phone after set it as controller number
    def set_controller_number(phone_number)
      # [3G*8800000015*0009*PW,111111]
      # [3G*8800000015*0002*PW]
      
    end

    def make_phone_call(phone_number)
      # [3G*8800000015*0010*CALL,00000000000]
      # [3G*8800000015*0004*CALL]
      
    end

    def start_remote_listening
      # [3G*YYYYYYYYYY*LEN*MONITOR]
      # [3G*YYYYYYYYYY*LEN*MONITOR]
      
    end

    def change_server_ip_address(ip, port)
      # [3G*8800000015*0014*IP,113.81.229.9,8080]
      # no response
      
    end

    def reset_settings
      # [3G*8800000015*0007*FACTORY]
      # [3G*8800000015*0007*FACTORY]
      
    end

    def query_device_version
      # [3G*8800000015*0005*VERNO]
      # [3G*8800000015*0028*VERNO,G29_BASE_V1.00_2014.04.23_17.46.49]
      
    end

    def restart_device
      # [3G*5678901234*0005*RESET]
      # [3G*5678901234*0005*RESET]
      
    end

    def turn_off_device
      # [3G*5678901234*0008*POWEROFF]
      # [3G*5678901234*0008* POWEROFF]
      
    end

    def set_setting_of_txt_sos
      # [3G*5678901234*0008*SOSSMS,0]
      # [3G*5678901234*0006*SOSSMS]
      
    end

  end
  
end