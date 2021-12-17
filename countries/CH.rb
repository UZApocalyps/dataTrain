require_relative './country.rb'
require_relative '../api.rb'

class CH < Country
    def lines
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=linie&q=&rows=10").body
        return response_body
    end
    def trains
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=rollmaterial&q=&facet=fahrzeug_art_struktur&facet=fahrzeug_typ&facet=baudatum_fahrzeug&facet=larmarm&facet=ansage_system_speicher&facet=dienst_raum_abteil&facet=eigengewicht_tara_zug&facet=druckertuchtigt&facet=el_anschluss_230_v_anzahl_ud&facet=el_anschluss_230_v_anzahl_od&facet=gepacktragerart&facet=in_train_innen&facet=in_train_versorgung&facet=lange_uber_puffer_lup&facet=platze_rollstuhle_nr_r_total&facet=restaurationsplatze_wr&facet=sitzpl_1_kl_nichtraucher&facet=sitzpl_2_kl_nichtraucher&facet=sitzplatze_pro_wagen_total&facet=ski_snowboardhalter&facet=veloabteil&facet=velohaken&facet=veloplattform&facet=velostander&facet=vmax_betrieblich_zugelassen")
        return response_body
    end
    def schedules 
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=ist-daten-sbb&q=&facet=betreiber_id&facet=produkt_id&facet=linien_id&facet=linien_text&facet=verkehrsmittel_text&facet=faellt_aus_tf&facet=bpuic&facet=ankunftszeit&facet=an_prognose&facet=an_prognose_status&facet=ab_prognose_status&facet=ankunftsverspatung&facet=abfahrtsverspatung")
        return response_body
    end
    def events
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=rail-traffic-information&q=&rows=10")
        return response_body
    end
    def trainsonlines
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=zugzahlen&q=&facet=isb&facet=strecke_nummer&facet=strecke_bezeichnung&facet=strecke_art&facet=bp_von_abschnitt&facet=bp_bis_abschnitt&facet=geschaeftscode&facet=jahr")
        return response_body
    end
    def structure
        response_body = Api.get("https://data.sbb.ch/api/records/1.0/search/?dataset=jahresformation&q=&facet=zug&facet=debicode&facet=zugart&facet=bhf_von&facet=bhf_bis&facet=umlauf&facet=block_bezeichnung&facet=beginnfahrplanperiode")
        return response_body
    end
end
