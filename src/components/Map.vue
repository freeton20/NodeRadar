<template>
<div>
    <yandex-map style="height: 100vh;"
        :coords="coords"
        :zoom="3" 
        @click="onClick"
        :settings="settings"
        :options="options"                
        >
        
        <ymap-marker :key="index" v-for="(point,index) in points" 
        :coords="[
            point.latitude,
            point.longitude,
        ]" 
        :marker-id="index" 
        :hint-content= "point.asnOrganization"
        />       
    </yandex-map>
</div>
</template>
<script>
import { yandexMap, ymapMarker } from 'vue-yandex-maps'
import { geoIp } from "../api";
import {yMapApiKey} from "../config";
export default {
  components: { yandexMap, ymapMarker },    
  data: () => ({
    coords: [
      54.82896654088406,
      39.831893822753904,
    ],
    points: null,
    settings: {
        apiKey: yMapApiKey,
        lang: 'en_RU',
        coordorder: 'latlong',
        enterprise: false,
        version: '2.1'
    },
    options: {
      autoFitToViewport: 'always'
    }
  }),
  methods: {
    onClick(e) {
      this.coords = e.get('coords');
    },
  }, 
  mounted() {
      geoIp().then((r)=>{     
      this.points = r;     
    });
  }
};

</script>