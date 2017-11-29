class SensorEndCommandService
  # There is a translate server we brought, it expects http request like the one below:
  # http://gps.lingx.com:6602/?json={"cmd":"1001","tid":"2600004009","content":"5B33472A323630303030343030392A303031382A47532C2D33362E3839373134362C3137342E3835343033345D","ticket":"43b2f84b-6e2d-4c4a-87d6-ab67e8c883ae"}
  # the content is according to protocol_spec.pdf in the repo
  BASE_URL = "http://gps.lingx.com:6602/".freeze

  attr_accessor :device_uuid

  def initialize(device_uuid)
    @device_uuid = device_uuid
  end

  def change_update_frequency(seconds)
    # send [3G*8800000015*0009*UPLOAD,60]
    # expect response [3G*8800000015*0006*UPLOAD60]
    # format spec: [company, device id, length of content, content]

    payload_content = "UPLOAD,#{seconds}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def set_ec_number(phone_number)
    # [3G*8800000015*0012*CENTER,00000000000]
    # [3G*8800000015*0006*CENTER]

    payload_content = "CENTER,#{phone_number}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  # Any number, expecting ec number, can control the phone after set it as controller number
  def set_controller_number(phone_number)
    # [3G*8800000015*0009*PW,111111]
    # [3G*8800000015*0002*PW]

    payload_content = "PW,#{phone_number}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def make_phone_call(phone_number)
    # [3G*8800000015*0010*CALL,00000000000]
    # [3G*8800000015*0004*CALL]

    payload_content = "CALL,#{phone_number}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def start_remote_listening
    # [3G*YYYYYYYYYY*LEN*MONITOR]
    # [3G*YYYYYYYYYY*LEN*MONITOR]

    payload_content = "MONITOR"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def change_server_ip_address(ip, port)
    # [3G*8800000015*0014*IP,113.81.229.9,8080]
    # no response

    payload_content = "IP#{ip},#{port}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def reset_settings
    # [3G*8800000015*0007*FACTORY]
    # [3G*8800000015*0007*FACTORY]

    payload_content = "FACTORY"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def query_device_version
    # [3G*8800000015*0005*VERNO]
    # [3G*8800000015*0028*VERNO,G29_BASE_V1.00_2014.04.23_17.46.49]

    payload_content = "VERNO"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def restart_device
    # [3G*5678901234*0005*RESET]
    # [3G*5678901234*0005*RESET]

    payload_content = "RESET"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  def turn_off_device
    # [3G*5678901234*0008*POWEROFF]
    # [3G*5678901234*0008* POWEROFF]

    payload_content = "POWEROFF"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  # 1 is ON, 0 is OFF
  def set_setting_of_txt_sos(swtich)
    # [3G*5678901234*0008*SOSSMS,0]
    # [3G*5678901234*0006*SOSSMS]

    payload_content = "SOSSMS#{swtich}"
    cmd = ['3G', device_uuid, to_16_acsii(payload_content.size), payload_content]
    send_request(cmd)
  end

  private

  def to_16_acsii(number)
    _res = number.to_s(16).rjust(4, '0')
    _res
  end

  def wrap_content_payload(content)
    _string = "[#{content}]"
    _encoded = _string.split('').map(&:ord).map{|e| e.to_s(16) }.join()
    _encoded
  end

  def send_request(cmd)
    _cmd = cmd.join('*')
    _wrapped_cmd = wrap_content_payload(_cmd)
    _ticket = "43b2f84b-6e2d-4c4a-87d6-ab67e8c883ae"
    _params = {cmd: '1001', tid: device_uuid, content: _wrapped_cmd, ticket: _ticket}.to_json

    RestClient.get(BASE_URL, params: {json: _params})
  end

end
