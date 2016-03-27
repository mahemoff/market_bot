require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

include MarketBot::Android

test_id = 'com.bluefroggaming.popdat'
test_src_data = read_file(File.dirname(__FILE__), 'data', 'app_1.txt')
test_src_data2 = read_file(File.dirname(__FILE__), 'data', 'app_2.txt')
test_src_data3 = read_file(File.dirname(__FILE__), 'data', 'app_3.txt')
test_src_data4 = read_file(File.dirname(__FILE__), 'data', 'app_4.txt')

def check_getters(app)
  it 'should populate the getters' do
    expect(app.title).to eq('Pop Dat')
    expect(app.rating).to eq('4.7')
    expect(app.updated).to eq('August 26, 2011')
    expect(app.current_version).to eq('1.0')
    expect(app.requires_android).to eq('2.2 and up')
    expect(app.category).to eq('Arcade')
    expect(app.category_url).to eq('GAME_ARCADE')
    expect(app.installs).to eq('500 - 1,000')
    expect(app.size).to eq('9.0M')
    expect(app.price).to eq('0')
    expect(app.content_rating).to eq('Everyone')
    expect(app.description).to match(/^<div.*?>An action-packed blend of split-second skill and luck-based gameplay!/)
    expect(app.votes).to eq('9')
    expect(app.more_from_developer).to eq([{:app_id=>"com.bluefroggaming.ghost_chicken"}])
    expect(app.users_also_installed).to eq([{:app_id=>"com.mac.warzonepaid"}, {:app_id=>"com.caresilabs.wheeljoy.paid"}, {:app_id=>"com.blazingsoft.crosswolf"}, {:app_id=>"org.vladest.Popcorn"}, {:app_id=>"com.mtb.dds"}, {:app_id=>"com.hdl.datbom"}, {:app_id=>"cz.dejvice.rc.Marvin"}, {:app_id=>"com.spectaculator.spectaculator"}, {:app_id=>"com.seleuco.xpectrum"}, {:app_id=>"app.usp"}, {:app_id=>"com.fms.speccy"}, {:app_id=>"com.reynoldssoft.sampler"}, {:app_id=>"com.dylanpdx.blockybird"}])
    expect(app.related).to eq([{:app_id=>"com.mac.warzonepaid"}, {:app_id=>"com.caresilabs.wheeljoy.paid"}, {:app_id=>"com.blazingsoft.crosswolf"}, {:app_id=>"org.vladest.Popcorn"}, {:app_id=>"com.mtb.dds"}, {:app_id=>"com.hdl.datbom"}, {:app_id=>"cz.dejvice.rc.Marvin"}, {:app_id=>"com.spectaculator.spectaculator"}, {:app_id=>"com.seleuco.xpectrum"}, {:app_id=>"app.usp"}, {:app_id=>"com.fms.speccy"}, {:app_id=>"com.reynoldssoft.sampler"}, {:app_id=>"com.dylanpdx.blockybird"}])
    expect(app.banner_icon_url).to eq('https://lh3.ggpht.com/e6QqjMM9K__moeCm2C5HRb0SmGX0XqzhnhiE1MUx8MdNVdQbQW9rhFX_qmtbtBxHAa0=w300')
    expect(app.banner_image_url).to eq('https://lh3.ggpht.com/e6QqjMM9K__moeCm2C5HRb0SmGX0XqzhnhiE1MUx8MdNVdQbQW9rhFX_qmtbtBxHAa0=w300')
    expect(app.website_url).to eq('http://bluefroggaming.com')
    expect(app.email).to eq('support@hdgames.zendesk.com')
    expect(app.youtube_video_ids).to eq([])
    expect(app.screenshot_urls).to eq(["https://lh6.ggpht.com/JJWPKPEvz5ivZEeph_gA_oB3VOXYrIrY9lGdGFWHVT4FVub6cUKqxkh5VyxbvVqMXg=h310", "https://lh6.ggpht.com/kPGbJqu42Ukxoa_XZlWxo349y3zNKCayjBD35V2bbt26ZmgpHDegTf8sS5C1VOoAiw=h310", "https://lh3.ggpht.com/S9VMzKxAWSS3IxeUtLYPn-zDg9ojTpVxeHbd3RhHqtXazGRV6-S0jsuNh-GneV9eE2A=h310", "https://lh5.ggpht.com/G0U5k5PpvuEdflN58qzr3uKHGsXk3QqwwLIL_KxVfGNicR7Gn42smetbTBn9SRftnyk=h310", "https://lh6.ggpht.com/j03lPKqJss6066_Q6AbZikU33PWgoR07cPLFgoE5IoNyXwMG6QVX_3-SgI741vnaVnu7=h310", "https://lh3.ggpht.com/YBrG1Hjv7vgNLwp9PaR77gQHwdpInuluSnq9qPG4BwwU7LItCy4m6RQt9YM1sJH1hjdq=h310"])
    expect(app.full_screenshot_urls).to eq(["https://lh6.ggpht.com/JJWPKPEvz5ivZEeph_gA_oB3VOXYrIrY9lGdGFWHVT4FVub6cUKqxkh5VyxbvVqMXg=h900", "https://lh6.ggpht.com/kPGbJqu42Ukxoa_XZlWxo349y3zNKCayjBD35V2bbt26ZmgpHDegTf8sS5C1VOoAiw=h900", "https://lh3.ggpht.com/S9VMzKxAWSS3IxeUtLYPn-zDg9ojTpVxeHbd3RhHqtXazGRV6-S0jsuNh-GneV9eE2A=h900", "https://lh5.ggpht.com/G0U5k5PpvuEdflN58qzr3uKHGsXk3QqwwLIL_KxVfGNicR7Gn42smetbTBn9SRftnyk=h900", "https://lh6.ggpht.com/j03lPKqJss6066_Q6AbZikU33PWgoR07cPLFgoE5IoNyXwMG6QVX_3-SgI741vnaVnu7=h900", "https://lh3.ggpht.com/YBrG1Hjv7vgNLwp9PaR77gQHwdpInuluSnq9qPG4BwwU7LItCy4m6RQt9YM1sJH1hjdq=h900"])
    expect(app.whats_new).to eq(nil)
    #app.permissions.should == [{:security=>"dangerous", :group=>"Network communication", :description=>"full Internet access", :description_full=>"Allows the app to create network sockets."}, {:security=>"dangerous", :group=>"Phone calls", :description=>"read phone state and identity", :description_full=>"Allows the app to access the phone features of the device. An app with this permission can determine the phone number and serial number of this phone, whether a call is active, the number that call is connected to and the like."}, {:security=>"safe", :group=>"Network communication", :description=>"view network state", :description_full=>"Allows the app to view the state of all networks."}]
    # Stubbing out for now, can't find them in the redesigned page.
    expect(app.permissions).to eq([])

    expect(app.rating_distribution).to eq({5=>8, 4=>0, 3=>0, 2=>1, 1=>0})
    expect(app.html.class).to eq(String)
  end
end

describe 'App' do
  context 'Construction' do
    it 'should copy the app_id param' do
      app = App.new(test_id)
      expect(app.app_id).to eq(test_id)
    end

    it 'should copy optional params' do
      hydra = Typhoeus::Hydra.new
      app = App.new(test_id, :hydra => hydra)
      expect(app.hydra).to equal(hydra)
    end
  end

  it 'should generate market URLs' do
    expect(App.new(test_id).market_url).to eq("https://play.google.com/store/apps/details?id=#{test_id}&hl=en")
  end

  context 'Parsing' do
    it 'should populate a hash with the correct keys/values' do
      result = App.parse(test_src_data)

      expect(result[:title]).to eq('Pop Dat')
      expect(result[:rating]).to eq('4.7')
      expect(result[:updated]).to eq('August 26, 2011')
      expect(result[:current_version]).to eq('1.0')
      expect(result[:requires_android]).to eq('2.2 and up')
      expect(result[:category]).to eq('Arcade')
      expect(result[:category_url]).to eq('GAME_ARCADE')
      expect(result[:installs]).to eq('500 - 1,000')
      expect(result[:size]).to eq('9.0M')
      expect(result[:price]).to eq('0')
      expect(result[:content_rating]).to eq('Everyone')
      expect(result[:description]).to match(/An action-packed blend of split-second/)
      expect(result[:votes]).to eq('9')
      expect(result[:developer]).to eq('Blue Frog Gaming')
      expect(result[:banner_icon_url]).to eq('https://lh3.ggpht.com/e6QqjMM9K__moeCm2C5HRb0SmGX0XqzhnhiE1MUx8MdNVdQbQW9rhFX_qmtbtBxHAa0=w300')
      expect(result[:website_url]).to eq('http://bluefroggaming.com')
      expect(result[:email]).to eq('support@hdgames.zendesk.com')
      expect(result[:youtube_video_ids]).to eq([])
      expect(result[:screenshot_urls]).to eq(["https://lh6.ggpht.com/JJWPKPEvz5ivZEeph_gA_oB3VOXYrIrY9lGdGFWHVT4FVub6cUKqxkh5VyxbvVqMXg=h310", "https://lh6.ggpht.com/kPGbJqu42Ukxoa_XZlWxo349y3zNKCayjBD35V2bbt26ZmgpHDegTf8sS5C1VOoAiw=h310", "https://lh3.ggpht.com/S9VMzKxAWSS3IxeUtLYPn-zDg9ojTpVxeHbd3RhHqtXazGRV6-S0jsuNh-GneV9eE2A=h310", "https://lh5.ggpht.com/G0U5k5PpvuEdflN58qzr3uKHGsXk3QqwwLIL_KxVfGNicR7Gn42smetbTBn9SRftnyk=h310", "https://lh6.ggpht.com/j03lPKqJss6066_Q6AbZikU33PWgoR07cPLFgoE5IoNyXwMG6QVX_3-SgI741vnaVnu7=h310", "https://lh3.ggpht.com/YBrG1Hjv7vgNLwp9PaR77gQHwdpInuluSnq9qPG4BwwU7LItCy4m6RQt9YM1sJH1hjdq=h310"])
      expect(result[:full_screenshot_urls]).to eq(["https://lh6.ggpht.com/JJWPKPEvz5ivZEeph_gA_oB3VOXYrIrY9lGdGFWHVT4FVub6cUKqxkh5VyxbvVqMXg=h900", "https://lh6.ggpht.com/kPGbJqu42Ukxoa_XZlWxo349y3zNKCayjBD35V2bbt26ZmgpHDegTf8sS5C1VOoAiw=h900", "https://lh3.ggpht.com/S9VMzKxAWSS3IxeUtLYPn-zDg9ojTpVxeHbd3RhHqtXazGRV6-S0jsuNh-GneV9eE2A=h900", "https://lh5.ggpht.com/G0U5k5PpvuEdflN58qzr3uKHGsXk3QqwwLIL_KxVfGNicR7Gn42smetbTBn9SRftnyk=h900", "https://lh6.ggpht.com/j03lPKqJss6066_Q6AbZikU33PWgoR07cPLFgoE5IoNyXwMG6QVX_3-SgI741vnaVnu7=h900", "https://lh3.ggpht.com/YBrG1Hjv7vgNLwp9PaR77gQHwdpInuluSnq9qPG4BwwU7LItCy4m6RQt9YM1sJH1hjdq=h900"])      
      expect(result[:whats_new]).to eq(nil)
      #result[:permissions].should == [{:security=>"dangerous", :group=>"Network communication", :description=>"full Internet access", :description_full=>"Allows the app to create network sockets."}, {:security=>"dangerous", :group=>"Phone calls", :description=>"read phone state and identity", :description_full=>"Allows the app to access the phone features of the device. An app with this permission can determine the phone number and serial number of this phone, whether a call is active, the number that call is connected to and the like."}, {:security=>"safe", :group=>"Network communication", :description=>"view network state", :description_full=>"Allows the app to view the state of all networks."}]
      # Stubbing out for now, can't find them in the redesigned page.
      expect(result[:permissions]).to eq([])
      expect(result[:rating_distribution]).to eq({5=>8, 4=>0, 3=>0, 2=>1, 1=>0})
      expect(result[:html]).to eq(test_src_data)

      result
    end

    it 'should populate a hash with the correct keys/values' do
      result = App.parse(test_src_data2)

      expect(result[:title]).to eq('Evernote')
      expect(result[:rating]).to eq('4.6')
      expect(result[:updated]).to eq('November 26, 2014')
      expect(result[:current_version]).to eq('Varies with device')
      expect(result[:requires_android]).to eq('Varies with device')
      expect(result[:category]).to eq('Productivity')
      expect(result[:category_url]).to eq('PRODUCTIVITY')
      expect(result[:size]).to eq('Varies with device')
      expect(result[:price]).to eq('0')
      expect(result[:content_rating]).to eq('Low Maturity')
      expect(result[:description]).to match(/New York Times/)
      expect(result[:votes]).to eq('1134111')
      expect(result[:developer]).to eq('Evernote Corporation')
      expect(result[:installs]).to eq('50,000,000 - 100,000,000')
      expect(result[:banner_icon_url]).to eq('https://lh5.ggpht.com/u_ZwBnOs3s7nHA2v4XDCrJknAAVVHQIzK4mVF8tbx1n62-_LrDSopwHviqeNuDIFigc=w300')
      expect(result[:banner_image_url]).to eq('https://lh5.ggpht.com/u_ZwBnOs3s7nHA2v4XDCrJknAAVVHQIzK4mVF8tbx1n62-_LrDSopwHviqeNuDIFigc=w300')
      expect(result[:website_url]).to eq('http://evernote.com/privacy/')
      expect(result[:email]).to eq('appstore-evernote-android@evernote.com')
      expect(result[:youtube_video_ids]).to eq(['UnpUIVO8Lmo'])
      expect(result[:screenshot_urls]).to eq(["https://lh5.ggpht.com/PVFHj_lDlc52wwNu0by2CLmUrSHaAx6NINjbe9qmk-NPo-S5UUA8oghVARMBHEWgXDU=h310", "https://lh5.ggpht.com/KvbOit3FFnfbOZ6rG23sDEVuC4ALtLGV0Q0zwu6vMKDCO4u69_zI-IhmD3jOGuJLEj4=h310", "https://lh5.ggpht.com/TEWuyLgIH6_514_1xpcqpcjFPSxu82Sak2RPuwbtexRqe-kJuW81DF5IRdS4Lis1KJQ=h310", "https://lh4.ggpht.com/KeGMsBnchmH9gywdjA1x7fqUpQX0UrMA_cMZbvr2hYHLiYTsCKOescqniEO4DItuHxU=h310", "https://lh5.ggpht.com/zWJ3VVV-sjT0mSADljAMyecO3QmcoFBtLBs8bETznU49X8avDRv3_iF5TkJkzVlu8qU=h310", "https://lh5.ggpht.com/3DqrNu-AHqGQQTDper8eTzpm9XEUNq605BxNSCkx4yGopa9u0TD2jBPHXdgwEPp08A=h310", "https://lh6.ggpht.com/9h0D2tvXlf6oLsylnNaaSdxjmm6rJuWeHvML-8zg5xoTp4akAjSXRCylxvF_dNTfoTU=h310", "https://lh5.ggpht.com/ugk2h_v0RrvAdzL7FfqD4jBONrfzboL6eAuFmkqvWg7zQiJUvkz6GThCU5pnKzCmRA=h310", "https://lh4.ggpht.com/3QUx47b-R9ex02vhUDH8h2hN3VDgS7e7rNAP7JCPaxaXr-GClb7jsZEsAyIr5iiwzw=h310", "https://lh5.ggpht.com/1LW-N8yEdwS1s-ZuvQSzqNMLaLldL8wBdLHhDY9TvPV8NnxBWIUjVaDZuat8I7V5uh4=h310", "https://lh4.ggpht.com/hIueHCJKvvAUrTrQQSSv6-2zpKMV-fdTIITHhMGfrulky5fEAR6KM1cpyUFD_9_kqw=h310", "https://lh4.ggpht.com/l-rQJVY9d2ZYZXWXnKfLUkTk6gGCE79Xopb__YlFeVZ974PBgfF4lK8olU67TvK3-g=h310", "https://lh4.ggpht.com/Q_2sTO9l0OIdDv801S2mlJI-vugeKROHHyPcWf7Hvavs5d-MU2v2RWS6sUOrF79gH1Hn=h310", "https://lh5.ggpht.com/1O17OJEpW3qZcyEyfljRcIHUIIAOiBlCc5SxHPghyv0evV4h2g-ZooBAL3xkog-kZYU=h310", "https://lh6.ggpht.com/nyn0trJ4OTdpb3SkH7ItJu8W4DdFNNW9P2AAr0OBA9q0H7y8KLxtc144tlSZXQIVKjE=h310", "https://lh6.ggpht.com/Yo4DN_K0v27ltrEEmJxI9XHn_BtGIgH6kLkxG3hG8Q0PeCJPpDv0FzDXLxbK2gkx0wY=h310"])
      expect(result[:full_screenshot_urls]).to eq(["https://lh5.ggpht.com/PVFHj_lDlc52wwNu0by2CLmUrSHaAx6NINjbe9qmk-NPo-S5UUA8oghVARMBHEWgXDU=h900", "https://lh5.ggpht.com/KvbOit3FFnfbOZ6rG23sDEVuC4ALtLGV0Q0zwu6vMKDCO4u69_zI-IhmD3jOGuJLEj4=h900", "https://lh5.ggpht.com/TEWuyLgIH6_514_1xpcqpcjFPSxu82Sak2RPuwbtexRqe-kJuW81DF5IRdS4Lis1KJQ=h900", "https://lh4.ggpht.com/KeGMsBnchmH9gywdjA1x7fqUpQX0UrMA_cMZbvr2hYHLiYTsCKOescqniEO4DItuHxU=h900", "https://lh5.ggpht.com/zWJ3VVV-sjT0mSADljAMyecO3QmcoFBtLBs8bETznU49X8avDRv3_iF5TkJkzVlu8qU=h900", "https://lh5.ggpht.com/3DqrNu-AHqGQQTDper8eTzpm9XEUNq605BxNSCkx4yGopa9u0TD2jBPHXdgwEPp08A=h900", "https://lh6.ggpht.com/9h0D2tvXlf6oLsylnNaaSdxjmm6rJuWeHvML-8zg5xoTp4akAjSXRCylxvF_dNTfoTU=h900", "https://lh5.ggpht.com/ugk2h_v0RrvAdzL7FfqD4jBONrfzboL6eAuFmkqvWg7zQiJUvkz6GThCU5pnKzCmRA=h900", "https://lh4.ggpht.com/3QUx47b-R9ex02vhUDH8h2hN3VDgS7e7rNAP7JCPaxaXr-GClb7jsZEsAyIr5iiwzw=h900", "https://lh5.ggpht.com/1LW-N8yEdwS1s-ZuvQSzqNMLaLldL8wBdLHhDY9TvPV8NnxBWIUjVaDZuat8I7V5uh4=h900", "https://lh4.ggpht.com/hIueHCJKvvAUrTrQQSSv6-2zpKMV-fdTIITHhMGfrulky5fEAR6KM1cpyUFD_9_kqw=h900", "https://lh4.ggpht.com/l-rQJVY9d2ZYZXWXnKfLUkTk6gGCE79Xopb__YlFeVZ974PBgfF4lK8olU67TvK3-g=h900", "https://lh4.ggpht.com/Q_2sTO9l0OIdDv801S2mlJI-vugeKROHHyPcWf7Hvavs5d-MU2v2RWS6sUOrF79gH1Hn=h900", "https://lh5.ggpht.com/1O17OJEpW3qZcyEyfljRcIHUIIAOiBlCc5SxHPghyv0evV4h2g-ZooBAL3xkog-kZYU=h900", "https://lh6.ggpht.com/nyn0trJ4OTdpb3SkH7ItJu8W4DdFNNW9P2AAr0OBA9q0H7y8KLxtc144tlSZXQIVKjE=h900", "https://lh6.ggpht.com/Yo4DN_K0v27ltrEEmJxI9XHn_BtGIgH6kLkxG3hG8Q0PeCJPpDv0FzDXLxbK2gkx0wY=h900"])
      expect(result[:whats_new]).to match(/What's New/)
      #result[:permissions].should == [{:security=>"dangerous", :group=>"Hardware controls", :description=>"record audio", :description_full=>"Allows the app to access the audio record path."}, {:security=>"dangerous", :group=>"Hardware controls", :description=>"take pictures and videos", :description_full=>"Allows the app to take pictures and videos with the camera. This allows the app at any time to collect images the camera is seeing."}, {:security=>"dangerous", :group=>"Your location", :description=>"coarse (network-based) location", :description_full=>"Access coarse location sources such as the cellular network database to determine an approximate tablet location, where available. Malicious apps may use this to determine approximately where you are. Access coarse location sources such as the cellular network database to determine an approximate phone location, where available. Malicious apps may use this to determine approximately where you are."}, {:security=>"dangerous", :group=>"Your location", :description=>"fine (GPS) location", :description_full=>"Access fine location sources such as the Global Positioning System on the tablet, where available. Malicious apps may use this to determine where you are, and may consume additional battery power. Access fine location sources such as the Global Positioning System on the phone, where available. Malicious apps may use this to determine where you are, and may consume additional battery power."}, {:security=>"dangerous", :group=>"Network communication", :description=>"full Internet access", :description_full=>"Allows the app to create network sockets."}, {:security=>"dangerous", :group=>"Your personal information", :description=>"read contact data", :description_full=>"Allows the app to read all of the contact (address) data stored on your tablet. Malicious apps may use this to send your data to other people. Allows the app to read all of the contact (address) data stored on your phone. Malicious apps may use this to send your data to other people."}, {:security=>"dangerous", :group=>"Your personal information", :description=>"read sensitive log data", :description_full=>"Allows the app to read from the system's various log files. This allows it to discover general information about what you are doing with the tablet, potentially including personal or private information. Allows the app to read from the system's various log files. This allows it to discover general information about what you are doing with the phone, potentially including personal or private information."}, {:security=>"dangerous", :group=>"Your personal information", :description=>"read calendar events plus confidential information", :description_full=>"Allows the app to read all calendar events stored on your tablet, including those of friends or coworkers. Malicious apps may extract personal information from these calendars without the owners' knowledge. Allows the app to read all calendar events stored on your phone, including those of friends or coworkers. Malicious apps may extract personal information from these calendars without the owners' knowledge."}, {:security=>"dangerous", :group=>"Phone calls", :description=>"read phone state and identity", :description_full=>"Allows the app to access the phone features of the device. An app with this permission can determine the phone number and serial number of this phone, whether a call is active, the number that call is connected to and the like."}, {:security=>"dangerous", :group=>"Storage", :description=>"modify/delete USB storage contents modify/delete SD card contents", :description_full=>"Allows the app to write to the USB storage. Allows the app to write to the SD card."}, {:security=>"dangerous", :group=>"System tools", :description=>"prevent tablet from sleeping prevent phone from sleeping", :description_full=>"Allows the app to prevent the tablet from going to sleep. Allows the app to prevent the phone from going to sleep."}, {:security=>"safe", :group=>"Your accounts", :description=>"discover known accounts", :description_full=>"Allows the app to get the list of accounts known by the tablet. Allows the app to get the list of accounts known by the phone."}, {:security=>"safe", :group=>"Hardware controls", :description=>"control vibrator", :description_full=>"Allows the app to control the vibrator."}, {:security=>"safe", :group=>"Network communication", :description=>"view network state", :description_full=>"Allows the app to view the state of all networks."}, {:security=>"safe", :group=>"Network communication", :description=>"view Wi-Fi state", :description_full=>"Allows the app to view the information about the state of Wi-Fi."}, {:security=>"safe", :group=>"Default", :description=>"Market billing service", :description_full=>"Allows the user to purchase items through Market from within this application"}]
      # Stubbing out for now, can't find them in the redesigned page.
      expect(result[:permissions]).to eq([])
      expect(result[:rating_distribution]).to eq({5=>833055, 4=>229395, 3=>39241, 2=>12003, 1=>20202})
      expect(result[:html]).to eq(test_src_data2)
    end

    it 'should populate a hash with the correct keys/values' do
      result = App.parse(test_src_data3)

      expect(result[:title]).to eq('WeatherPro')
      expect(result[:updated]).to eq('October 1, 2014')
      expect(result[:current_version]).to eq('3.5.2')
      expect(result[:requires_android]).to eq('2.3 and up')
      expect(result[:category]).to eq('Weather')
      expect(result[:category_url]).to eq('WEATHER')
      expect(result[:size]).to eq('9.1M')
      expect(result[:price]).to eq('$2.99')
      expect(result[:content_rating]).to eq('Low Maturity')
      expect(result[:description]).to match(/^.*WeatherPro answers the question - what's the best Android Weather app/)
      expect(result[:developer]).to eq('MeteoGroup')
      expect(result[:rating]).to eq("4.4")
      expect(result[:votes]).to eq("32543")
      expect(result[:banner_icon_url]).to eq('https://lh5.ggpht.com/gEwuqrqo9Hu2qRNfBi8bLs0XByBQEmhvBhyNXJLuPmrT47GNfljir8ddam-Plzhovrg=w300')
      expect(result[:banner_image_url]).to eq('https://lh5.ggpht.com/gEwuqrqo9Hu2qRNfBi8bLs0XByBQEmhvBhyNXJLuPmrT47GNfljir8ddam-Plzhovrg=w300')
      expect(result[:website_url]).to eq('http://www.meteogroup.com/en/gb/about-meteogroup/privacy-policy-and-cookies.html')
      expect(result[:email]).to eq('support@android.weatherpro.de')
      expect(result[:youtube_video_ids]).to eq([])
      expect(result[:whats_new]).to match(/Access to WeatherPro app via car infotainment screen/)
      #result[:permissions].should == [{:security=>"dangerous", :group=>"Your location", :description=>"fine (GPS) location", :description_full=>"Access fine location sources such as the Global Positioning System on the tablet, where available. Malicious apps may use this to determine where you are, and may consume additional battery power. Access fine location sources such as the Global Positioning System on the phone, where available. Malicious apps may use this to determine where you are, and may consume additional battery power."}, {:security=>"dangerous", :group=>"Network communication", :description=>"full Internet access", :description_full=>"Allows the app to create network sockets."}, {:security=>"safe", :group=>"Network communication", :description=>"view network state", :description_full=>"Allows the app to view the state of all networks."}]
      # Stubbing out for now, can't find them in the redesigned page.
      expect(result[:permissions]).to eq([])
      expect(result[:rating_distribution]).to eq({5=>20184, 4=>8344, 3=>1749, 2=>801, 1=>1454})
      expect(result[:html]).to eq(test_src_data3)
    end

    it 'should populate the associated apps keys' do
      result = App.parse(test_src_data2)

      expect(result[:related]).to be_a(Array)
      expect(result[:users_also_installed]).to be_a(Array)
      expect(result[:more_from_developer]).to be_a(Array)

      expect(result[:related].first[:app_id]).to eq('com.socialnmobile.dictapps.notepad.color.note')
      expect(result[:users_also_installed].first[:app_id]).to eq('com.socialnmobile.dictapps.notepad.color.note')
      expect(result[:more_from_developer].first[:app_id]).to eq('com.evernote.widget')
    end

    it 'should populate the reviews' do
      result = App.parse(test_src_data4)
      expect(result[:reviews]).to be_a(Array)
      result[:reviews].size == 9
      expect(result[:reviews][2][:author_name]).to eq('sidi Gueye')
      expect(result[:reviews][2][:review_title]).to  eq('Trop cool')
      expect(result[:reviews][2][:review_text]).to  eq("J'ai vraiment adoré l'appli c trop cool !!")
      expect(result[:reviews][2][:review_score]).to  eq(5)
    end

  end

  context 'Updating' do
    context 'Quick API' do
      app = App.new(test_id)

      response = Typhoeus::Response.new(:code => 200, :headers => '', :body => test_src_data)
      Typhoeus.stub(app.market_url).and_return(response)

      app.update
      check_getters(app)
    end

    context "Quick API not found" do
      let(:app) { App.new(test_id) }

      before do
        response = Typhoeus::Response.new(:code => 404)
        Typhoeus.stub(app.market_url).and_return(response)
      end

      it "raises a ResponseError" do
        expect {
          app.update
        }.to raise_error(MarketBot::ResponseError)
      end
    end

    context 'Batch API' do
      hydra = Typhoeus::Hydra.new
      app = App.new(test_id, :hydra => hydra)

      response = Typhoeus::Response.new(:code => 200, :headers => '', :body => test_src_data)
      Typhoeus.stub(app.market_url).and_return(response)

      callback_flag = false

      app.enqueue_update do |a|
        callback_flag = true
      end

      hydra.run

      it 'should call the callback' do
        expect(callback_flag).to be(true)
      end

      check_getters(app)
    end

    context 'Batch API parser error' do
      hydra = Typhoeus::Hydra.new
      app = App.new(test_id, :hydra => hydra)

      response = Typhoeus::Response.new(:code => 200, :headers => '', :body => 'some broken app page')
      Typhoeus.stub(app.market_url).and_return(response)

      callback_flag = false
      error = nil

      app.enqueue_update do |a|
        callback_flag = true
        error = a.error
      end

      hydra.run

      it 'should call the callback' do
        expect(callback_flag).to be(true)
      end

      it 'should set error to the exception' do
        expect(error).to be_a(Exception)
      end
    end
  end
end
