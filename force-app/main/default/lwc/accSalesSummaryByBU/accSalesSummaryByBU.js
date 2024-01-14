import { api, LightningElement, track, wire } from 'lwc';
import initMethod from '@salesforce/apex/SalesController.initMethod';
export default class AccSalesSummaryByBU extends LightningElement {
  prevYear;
  currYear;
  currYearLast
  @api recordId;
  @track error;
  @track bu;
  salesObj;
  @track buListUpdated =[];
  @track salesList=[];

  saleslistPrevTop = [
    {
        "key": "528235",
        "value": "VISISTAT 35W 6/BOX"
    }, {
        "key": "544240",
        "value": "HEMOLOK L CLIPS 6/CART 84/BOX"
    }, {
        "key": "001205",
        "value": "HORIZON TI SMALL RED 25 POUCHES WITH 24"
    }, {
        "key": "002204",
        "value": "HORIZON TI MED 25 POUCHES WITH 24 CLIPS"
    }, {
        "key": "9079P-EU-005",
        "value": "EZ-IO 45MM NEEDLE + STABILIZER BX/5 (EU)"
    }, {
        "key": "A-6000-08LF",
        "value": "PE ADULT-PED DRY/ WET LF 6/CS"
    }, {
        "key": "AW-04018",
        "value": "SPRING WIRE GUIDE COMPONENT"
    }, {
        "key": "CS-42854-E",
        "value": "CVC SET: 4-LUMEN 8.5 FR X 16 CM"
    }, {
        "key": "CS-42854-HP",
        "value": "CVC KIT: 4-LUMEN 8.5FR X 16CM"
    }, {
        "key": "CS-45854-HP",
        "value": "CVC KIT: 4-LUMEN 8.5FR X 20CM"
    }
  ]

  saleslistCurrTop = [
    {
        "key": "001205",
        "value": 22550
    }, {
        "key": "002204",
        "value": 32800
    }, {
        "key": "528235",
        "value": 5200
    }, {
        "key": "544240",
        "value": 17360
    }, {
        "key": "AW-04018",
        "value": 780
    }, {
        "key": "CS-42854-E",
        "value": 58305
    }, {
        "key": "A-6000-08LF",
        "value": 25414.49
    }, {
        "key": "CS-42854-HP",
        "value": 23140
    }, {
        "key": "CS-45854-HP",
        "value": 10965
    }, {
        "key": "9079P-EU-005",
        "value": 0
    }
  ]

  description = {
    "528235": "VISISTAT 35W 6/BOX",
    "544240": "HEMOLOK L CLIPS 6/CART 84/BOX",
    "001205": "HORIZON TI SMALL RED 25 POUCHES WITH 24",
    "002204": "HORIZON TI MED 25 POUCHES WITH 24 CLIPS",
    "105200-000040": "LMA Unique (Silicone) Cuff Pilot 4",
    "9079P-EU-005": "EZ-IO 45MM NEEDLE + STABILIZER BX/5 (EU)",
    "A-6000-08LF": "PE ADULT-PED DRY/ WET LF 6/CS",
    "AW-04018": "SPRING WIRE GUIDE COMPONENT",
    "CS-42854-E": "CVC SET: 4-LUMEN 8.5 FR X 16 CM",
    "CS-45854-HP": "CVC KIT: 4-LUMEN 8.5FR X 20CM"
  }

  connectedCallback() {
    initMethod({})
    .then(result => {
      if (result) {
        this.salesObj=JSON.parse(result);
        var today = new Date();
        this.prevYear =today.getFullYear()-2;
        this.currYear =today.getFullYear()-1;
        this.currYearLast = today.getFullYear(); 
        
        this.buListFinal=this.salesObj.buListFinal;
        this.buListFinal.forEach(bu => {
          if (bu === this.salesObj.bu) {
            this.buIsBold = true;
            this.bu=bu;
          } else {
            this.buIsBold = false;
            this.bu=bu;
          }
          this.buListUpdated.push(this.bu);
        });
        console.log("***buListUpdated*** "+JSON.stringify(this.buListUpdated));
        console.log("data succesfully loaded "+ result);
    
        var sMapRes = this.salesObj.salesMap;
        
        var key;
        var subPrev;
        var subCurr;
        console.log(sMapRes);

        let buList = this.buListUpdated;
        
        for (var bu in buList) {
          let keyId = '';
          let buVal = '';
          let currVal = 0;
          let prevVal = 0;

          for (var key in sMapRes) {
            subPrev = key.substring(4);
            subCurr = key.substring(4);

            if (key.indexOf(buList[bu]) >= 0) {
              buVal = key.substring(4);
              keyId = key;

              if (key.indexOf(this.prevYear) >= 0) {
                if(sMapRes[key]>0){
                  prevVal = sMapRes[key];
                } 
              }
              else if (key.indexOf(this.currYear) >= 0) {
                if(sMapRes[key]>0){
                  currVal = sMapRes[key];
                }
              }
            }
          }
          this.salesList.push({ id:keyId, bu:buVal, curVal:currVal, prevVal:prevVal} );
        }
        console.log("***salesList*** "+JSON.stringify(this.salesList));
      }
    }).catch (error => {
      this.error = error;
      console.log("An error occurred " + error);
    })

    console.log("***saleslistPrevTop*** " + JSON.stringify(this.saleslistPrevTop));
    console.log("***saleslistCurrTop*** " + JSON.stringify(this.saleslistCurrTop));
    console.log("***description*** " + JSON.stringify(this.description));

    let desc = this.description;
    for (var key in desc) {
      console.log("***key*** " + key);
      console.log("***key*** " + desc[key]);
    }

    // const product = [...saleslistPrevTop, ...saleslistCurrTop, ...description].reduce((acc,sale) => {
    //   if (acc.find((item) => item.material == sale.material)) {
    //     const itemIndex = acc.findIndex((item) => item.material == sale.material)
    //     acc[itemIndex] = {... acc[itemIndex], ...sale}
    //     return acc;
    //   } else {
    //     acc.push(sale)
    //     return acc;
    //   }
    // },[])
  }


 
      
  // @wire(initMethod,{ })
  // wiredInitMethod({ data, error }) {

  //   console.log("error "+ JSON.stringify(error));
  //   console.log("data succesfully loaded "+ JSON.stringify(data));
  
  //   // if (data) {
  //   //   this.salesObj=data;
  //   //   var today = new Date();
  //   //   this.prevYear =today.getFullYear()-1;
  //   //   this.currYear = today.getFullYear(); 
      
  //   //   this.buListFinal=this.salesObj.buListFinal;
  //   //   this.buListFinal.forEach(bu => {
  //   //     if (bu === this.salesObj.bu) {
  //   //         this.buIsBold = true;
  //   //       this.bu=bu;
  //   //     } else {
  //   //       this.buIsBold = false;
  //   //       this.bu=bu;
  //   //     }
  //   //     this.buListUpdated.push(this.bu);
  //   //   });
  //   //   console.log("data succesfully loaded "+ JSON.stringify(data));
  
  //   //   var sMapRes = this.salesObj.salesMap;
      
  //   //   var key;
  //   //   var subPrev;
  //   //   var subCurr;
  //   //   console.log(sMapRes);
                  
  //   //   for (var key in sMapRes) {
  //   //     subPrev = key.substring(4);
  //   //     subCurr = key.substring(4);
          
  //   //     console.log('*** key *** ' + key);
  //   //     console.log('****value ***'+sMapRes[key]);
        
  //   //     if (key.indexOf(this.prevYear) >= 0) {
  //   //       console.log('*** subPrev *** ' + subPrev);
  //   //       if(sMapRes[key]>0){
            
  //   //       } 
  //   //     }
  //   //     else if (key.indexOf(this.currYear) >= 0) {
  //   //       if(sMapRes[key]>0){
  //   //         console.log('*** subCurr *** ' + subCurr);
  //   //         this.salesMapCurr.push(sMapRes[key]);
  //   //         console.log('***salesMapCurr***'+this.salesMapCurr);
  //   //       }
  //   //     }
  //   //     // this.salesList.push(salesItem { id:key, bu:subPrev, curVal:sMapRes[key], prevVal:sMapRes[key]} );
  //   //   }
      
  //   //   console.log("***PREV YEAR SALES update*** "+JSON.stringify(this.salesMapPrev));
  //   //   console.log("***CURR YEAR SALES*** "+JSON.stringify(this.salesMapCurr));
      
  //   //   }
  //   //   else if (error){
  //   //   this.error=error;
  //   //   console.log("An error occurred "+error);
  //   // }
  // }
}