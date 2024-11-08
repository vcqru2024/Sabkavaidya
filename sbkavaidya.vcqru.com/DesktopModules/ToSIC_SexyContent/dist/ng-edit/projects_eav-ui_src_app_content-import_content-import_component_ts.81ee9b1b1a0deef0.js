"use strict";(self.webpackChunkeav_ui=self.webpackChunkeav_ui||[]).push([["projects_eav-ui_src_app_content-import_content-import_component_ts"],{9588:(E,g,a)=>{a.r(g),a.d(g,{ContentImportComponent:()=>U});var _=a(600),d=a(4844),v=a(5876),h=a(604),I=a(4816),u=a(533),R=a(692),s=a(2108),t=a(4896),c=a(5204),m=a(3884),p=a(8200),f=a(4672),C=a(1904),O=a(1232),y=a(5056);function D(n,l){if(1&n){const e=t.KQA();t.I0R(0,"form",null,6)(2,"div",7)(3,"div")(4,"button",8),t.qCj("click",function(){t.usT(e);const i=t.Gew(8);return t.CGJ(i.click())}),t.I0R(5,"span"),t.OEk(6),t.C$Y()(),t.I0R(7,"input",9,10),t.qCj("change",function(i){t.usT(e);const r=t.GaO(3);return t.CGJ(r.fileChange(i))}),t.C$Y()(),t.I0R(9,"div")(10,"p",11),t.OEk(11,"References to pages / files"),t.C$Y(),t.I0R(12,"mat-radio-group",12),t.qCj("ngModelChange",function(i){t.usT(e);const r=t.GaO(3);return t.CGJ(r.formValues.resourcesReferences=i)}),t.I0R(13,"mat-radio-button",13),t.OEk(14," Import links as written in the file (for example /Portals/...) "),t.C$Y(),t.I0R(15,"mat-radio-button",14),t.OEk(16," Try to resolve paths to references "),t.C$Y()()(),t.I0R(17,"div")(18,"p",11),t.OEk(19,"Clear all other entities"),t.C$Y(),t.I0R(20,"mat-radio-group",15),t.qCj("ngModelChange",function(i){t.usT(e);const r=t.GaO(3);return t.CGJ(r.formValues.clearEntities=i)}),t.I0R(21,"mat-radio-button",16),t.OEk(22," Keep all entities not found in import "),t.C$Y(),t.I0R(23,"mat-radio-button",17),t.OEk(24," Remove all entities not found in import "),t.C$Y()()(),t.I0R(25,"p",18),t.OEk(26,"Remember to backup your DNN first!"),t.C$Y()(),t.I0R(27,"mat-dialog-actions",19)(28,"button",20),t.qCj("click",function(){t.usT(e);const i=t.GaO(3);return t.CGJ(i.closeDialog())}),t.OEk(29,"Cancel"),t.C$Y(),t.I0R(30,"button",21),t.qCj("click",function(){t.usT(e);const i=t.GaO(3);return t.CGJ(i.evaluateContent())}),t.OEk(31," Preview Import "),t.C$Y()()()}if(2&n){const e=t.GaO(3);t.yG2(6),t.cNF(e.formValues.file?e.formValues.file.name:"Select or drop file"),t.yG2(6),t.E7m("ngModel",e.formValues.resourcesReferences),t.yG2(8),t.E7m("ngModel",e.formValues.clearEntities),t.yG2(10),t.E7m("disabled",!e.formValues.file||!e.formValues.file.name)}}function T(n,l){1&n&&(t.I0R(0,"div",7)(1,"p"),t.OEk(2,"Please wait while processing..."),t.C$Y()())}function $(n,l){if(1&n&&(t.I0R(0,"div",7)(1,"p",23),t.OEk(2),t.C$Y(),t.I0R(3,"p",23),t.OEk(4,"File contains:"),t.C$Y(),t.I0R(5,"ul",24)(6,"li"),t.OEk(7),t.C$Y(),t.I0R(8,"li"),t.OEk(9),t.C$Y(),t.I0R(10,"li"),t.OEk(11),t.C$Y()(),t.I0R(12,"p",23),t.OEk(13,"If you press Import, it will:"),t.C$Y(),t.I0R(14,"ul",24)(15,"li"),t.OEk(16),t.C$Y(),t.I0R(17,"li"),t.OEk(18),t.C$Y(),t.I0R(19,"li"),t.OEk(20),t.C$Y(),t.I0R(21,"li"),t.OEk(22),t.C$Y()(),t.I0R(23,"p",18),t.OEk(24,"Note: The import validates much data and may take several minutes."),t.C$Y()()),2&n){const e=t.GaO(4),o=t.GaO();t.yG2(2),t.oRS("Try to import file '",o.formValues.file.name,"'"),t.yG2(5),t.oRS("",e.evaluationResult.Detail.DocumentElementsCount," content-items (records/entities)"),t.yG2(2),t.oRS("",e.evaluationResult.Detail.LanguagesInDocumentCount," languages"),t.yG2(2),t.CAO("",e.evaluationResult.Detail.AttributeNamesInDocument.length," columns: ",e.evaluationResult.Detail.AttributeNamesInDocument.join(", "),""),t.yG2(5),t.oRS("Create ",e.evaluationResult.Detail.AmountOfEntitiesCreated," content-items"),t.yG2(2),t.oRS("Update ",e.evaluationResult.Detail.AmountOfEntitiesUpdated," content-items"),t.yG2(2),t.oRS("Delete ",e.evaluationResult.Detail.AmountOfEntitiesDeleted," content-items"),t.yG2(2),t.CAO("Ignore ",e.evaluationResult.Detail.AttributeNamesNotImported.length," columns: ",e.evaluationResult.Detail.AttributeNamesNotImported.join(", "),"")}}function G(n,l){if(1&n&&(t.I0R(0,"div")(1,"i"),t.OEk(2),t.C$Y()()),2&n){const e=t.GaO().$implicit;t.yG2(2),t.oRS("Details: ",e.ErrorDetail,"")}}function S(n,l){if(1&n&&(t.I0R(0,"div")(1,"i"),t.OEk(2),t.C$Y()()),2&n){const e=t.GaO().$implicit;t.yG2(2),t.oRS("Line-no: ",e.LineNumber,"")}}function x(n,l){if(1&n&&(t.I0R(0,"div")(1,"i"),t.OEk(2),t.C$Y()()),2&n){const e=t.GaO().$implicit;t.yG2(2),t.oRS("Line-details: ",e.LineDetail,"")}}function M(n,l){if(1&n&&(t.I0R(0,"li")(1,"div"),t.OEk(2),t.C$Y(),t.yuY(3,G,3,1,"div")(4,S,3,1,"div")(5,x,3,1,"div"),t.C$Y()),2&n){const e=l.$implicit,o=t.GaO(6);t.yG2(2),t.cNF(o.errors[e.ErrorCode]),t.yG2(1),t.C0Y(3,e.ErrorDetail?3:-1),t.yG2(1),t.C0Y(4,e.LineNumber?4:-1),t.yG2(1),t.C0Y(5,e.LineDetail?5:-1)}}function Y(n,l){if(1&n&&(t.I0R(0,"div",7)(1,"p",23),t.OEk(2),t.C$Y(),t.I0R(3,"ul",24),t.c53(4,M,6,4,"li",null,t.oxv),t.C$Y()()),2&n){const e=t.GaO(4),o=t.GaO();t.yG2(2),t.oRS("Try to import file '",o.formValues.file.name,"'"),t.yG2(2),t.oho(e.evaluationResult.Errors)}}function k(n,l){if(1&n){const e=t.KQA();t.yuY(0,$,25,10,"div",22)(1,Y,6,1,"div",22),t.I0R(2,"mat-dialog-actions",19)(3,"button",20),t.qCj("click",function(){t.usT(e);const i=t.GaO(4);return t.CGJ(i.back())}),t.OEk(4,"Back"),t.C$Y(),t.I0R(5,"button",21),t.qCj("click",function(){t.usT(e);const i=t.GaO(4);return t.CGJ(i.importContent())}),t.OEk(6," Import "),t.C$Y()()}if(2&n){const e=t.GaO(3);t.C0Y(0,e.evaluationResult.Success?0:-1),t.yG2(1),t.C0Y(1,e.evaluationResult.Success?-1:1),t.yG2(4),t.E7m("disabled",!e.evaluationResult.Success)}}function P(n,l){if(1&n&&t.yuY(0,k,7,3,"mat-dialog-actions",19),2&n){const e=t.GaO(2);t.C0Y(0,e.evaluationResult?0:-1)}}function b(n,l){1&n&&(t.I0R(0,"p"),t.OEk(1,"Import done."),t.C$Y())}function w(n,l){1&n&&(t.I0R(0,"p"),t.OEk(1,"Import failed."),t.C$Y())}function A(n,l){if(1&n&&(t.I0R(0,"div",7),t.yuY(1,b,2,0,"p")(2,w,2,0,"p"),t.C$Y()),2&n){const e=t.GaO(3);t.yG2(1),t.C0Y(1,e.importResult.Success?1:-1),t.yG2(1),t.C0Y(2,e.importResult.Success?-1:2)}}function L(n,l){if(1&n){const e=t.KQA();t.yuY(0,A,3,2,"div",22),t.I0R(1,"mat-dialog-actions",19)(2,"button",25),t.qCj("click",function(){t.usT(e);const i=t.GaO(3);return t.CGJ(i.closeDialog())}),t.OEk(3,"Close"),t.C$Y()()}if(2&n){const e=t.GaO(2);t.C0Y(0,e.importResult?0:-1)}}function B(n,l){if(1&n&&t.yuY(0,D,32,4)(1,T,3,0)(2,P,1,1)(3,L,4,1),2&n){const e=t.GaO();let o;t.C0Y(0,1===(o=e.viewStateSelected)?0:0===o?1:2===o?2:3===o?3:-1)}}function K(n,l){if(1&n){const e=t.KQA();t.I0R(0,"div",1),t.qCj("filesDropped",function(i){t.usT(e);const r=t.GaO();return t.CGJ(r.filesDropped(i))}),t.I0R(1,"div",2)(2,"div",3),t.OEk(3),t.C$Y()(),t.I0R(4,"div",4)(5,"p"),t.OEk(6," This will import content-items into 2sxc. It requires that you already defined the content-type before you try importing, and that you created the import-file using the template provided by the Export. Please visit "),t.I0R(7,"a",5),t.OEk(8,"https://2sxc.org/help"),t.C$Y(),t.OEk(9," for more instructions. "),t.C$Y()(),t.yuY(10,B,4,1),t.C$Y()}if(2&n){const e=t.GaO();t.E7m("allowedFileTypes","xml"),t.yG2(3),t.oRS("",null==l.contentType?null:l.contentType.Name," Import Data"),t.yG2(7),t.C0Y(10,null!=e.formValues?10:-1)}}let U=(()=>{class n{constructor(e,o,i,r,W,F){this.dialogData=e,this.dialogRef=o,this.route=i,this.contentImportService=r,this.appDialogConfigService=W,this.contentTypesService=F,this.hostClass="dialog-component",this.contentType$=new d.g(null),this.loading$=new d.g(!1),this.viewStates={waiting:0,default:1,evaluated:2,imported:3},this.viewStateSelected$=new d.g(this.viewStates.default),this.evaluationResult$=new d.g(null),this.importResult$=new d.g(null),this.viewModel$=(0,v.E)([this.contentType$,this.loading$,this.viewStateSelected$,this.evaluationResult$,this.importResult$]).pipe((0,h.k)(([N,V,j,J,z])=>({contentType:N,loading:V,viewStateSelected:j,evaluationResult:J,importResult:z}))),this.errors={0:"Unknown error occured.",1:"Selected content-type does not exist.",2:"Document is not a valid XML file.",3:"Selected content-type does not match the content-type in the XML file.",4:"The language is not supported.",5:"The document does not specify all languages for all entities.",6:"Language reference cannot be parsed, the language is not supported.",7:"Language reference cannot be parsed, the read-write protection is not supported.",8:"Value cannot be read, because of it has an invalid format."},this.contentTypeStaticName=this.route.snapshot.paramMap.get("contentTypeStaticName")}ngOnInit(){this.loading$.next(!0);const e=this.contentTypesService.retrieveContentType(this.contentTypeStaticName),o=this.appDialogConfigService.getShared$();(0,I.y)([e,o]).subscribe(([i,r])=>{this.contentType$.next(i),this.formValues={defaultLanguage:r.Context.Language.Primary,contentType:this.contentTypeStaticName,file:null!=this.dialogData.files?this.dialogData.files[0]:null,resourcesReferences:"Keep",clearEntities:"None"},this.loading$.next(!1)})}ngOnDestroy(){this.contentType$.complete(),this.loading$.complete(),this.viewStateSelected$.complete(),this.evaluationResult$.complete(),this.importResult$.complete()}closeDialog(){this.dialogRef.close()}evaluateContent(){this.viewStateSelected$.next(this.viewStates.waiting),this.contentImportService.evaluateContent(this.formValues).subscribe(e=>{this.evaluationResult$.next(e),this.viewStateSelected$.next(this.viewStates.evaluated)})}importContent(){this.viewStateSelected$.next(this.viewStates.waiting),this.contentImportService.importContent(this.formValues).subscribe(e=>{this.importResult$.next(e),this.viewStateSelected$.next(this.viewStates.imported)})}back(){this.viewStateSelected$.next(this.viewStates.default),this.evaluationResult$.next(null)}fileChange(e){this.formValues.file=e.target.files[0]}filesDropped(e){this.formValues.file=e[0]}static#t=this.\u0275fac=function(o){return new(o||n)(t.GI1(_.sR),t.GI1(_.yI),t.GI1(c.gV),t.GI1(s.u),t.GI1(u.m),t.GI1(R.X))};static#e=this.\u0275cmp=t.In1({type:n,selectors:[["app-content-import"]],hostVars:1,hostBindings:function(o,i){2&o&&t.SoX("className",i.hostClass)},decls:2,vars:3,consts:[["class","eav-dialog","appDragAndDrop","",3,"allowedFileTypes"],["appDragAndDrop","",1,"eav-dialog",3,"allowedFileTypes","filesDropped"],[1,"eav-dialog-header"],[1,"eav-dialog-header__title"],[1,"eav-dialog-description"],["href","https://2sxc.org/help","target","_blank"],["ngForm","ngForm"],[1,"eav-dialog-content"],["mat-raised-button","","tippy","Open file browser",3,"click"],["type","file",1,"hide",3,"change"],["fileInput",""],[1,"eav-radio-group-label"],["name","ResourcesReferences",1,"eav-radio-group",3,"ngModel","ngModelChange"],["value","Keep"],["value","Resolve"],["name","ClearEntities",1,"eav-radio-group",3,"ngModel","ngModelChange"],["value","None"],["value","All"],[1,"eav-hint"],["align","end"],["mat-raised-button","",3,"click"],["mat-raised-button","","color","accent",3,"disabled","click"],["class","eav-dialog-content"],[1,"eav-evaluation__title"],[1,"eav-evaluation__content"],["mat-raised-button","","color","accent",3,"click"]],template:function(o,i){if(1&o&&(t.yuY(0,K,11,3,"div",0),t.wVc(1,"async")),2&o){let r;t.C0Y(0,(r=t.kDX(1,1,i.viewModel$))?0:-1,r)}},dependencies:[m.Q,p.Y,_.Yp,f.Gw,C.sz,C.ue,C.u,C._G,C.SC,O.cv,O.cT,y.a],styles:[".eav-radio-group-label[_ngcontent-%COMP%]{font-size:18px;margin:24px 0 0}.eav-radio-group[_ngcontent-%COMP%]{display:flex;flex-direction:column;margin:8px 0}.eav-hint[_ngcontent-%COMP%]{font-size:18px;margin-top:24px;margin-bottom:16px}.eav-evaluation__title[_ngcontent-%COMP%]{font-size:18px;margin:24px 0 0;font-weight:700}.eav-evaluation__content[_ngcontent-%COMP%]{font-size:14px}.eav-evaluation__content[_ngcontent-%COMP%]   li[_ngcontent-%COMP%]{padding:2px 0}"]})}return n})()},3884:(E,g,a)=>{a.d(g,{Q:()=>I});var _=a(4896),d=a(3244),v=a(6884),h=a(4648);let I=(()=>{class u extends v.C{constructor(s,t,c){super(),this.zone=t,this.snackBar=c,this.markStyle="outline",this.allowedFileTypes="",this.filesDropped=new _._w7,this.dropAreaClass="eav-droparea",this.dragClass="eav-dragover",this.timeouts=[],this.element=s.nativeElement}ngOnInit(){this.markStyleClass=`eav-droparea-${this.markStyle}`,this.element.classList.add(this.dropAreaClass,this.markStyleClass),this.zone.runOutsideAngular(()=>{this.subscription.add((0,d.w)(this.element,"dragover").subscribe(s=>{s.preventDefault(),s.stopPropagation(),this.clearTimeouts(),this.element.classList.add(this.dragClass)})),this.subscription.add((0,d.w)(this.element,"dragleave").subscribe(s=>{s.preventDefault(),s.stopPropagation(),this.timeouts.push(window.setTimeout(()=>{this.element.classList.remove(this.dragClass)},50))}))})}ngOnDestroy(){this.clearTimeouts(),this.element.classList.remove(this.dropAreaClass,this.markStyleClass,this.dragClass),super.ngOnDestroy()}onDrop(s){s.preventDefault(),s.stopPropagation(),this.clearTimeouts(),this.element.classList.remove(this.dragClass);let c=Array.from(s.dataTransfer.files);c=this.filterTypes(c,this.allowedFileTypes),c.length>0&&this.filesDropped.emit(c)}clearTimeouts(){for(const s of this.timeouts)clearTimeout(s);this.timeouts=[]}filterTypes(s,t){if(""===t)return s;const c=t.split(",").map(p=>p.toLocaleLowerCase()),m=s.filter(p=>{const f=p.name.lastIndexOf(".");if(f<=0)return!1;const C=p.name.substring(f+1).toLocaleLowerCase();return c.includes(C)});if(s.length!==m.length){const p=this.allowedFileTypes.replace(/\,/g,", ");this.snackBar.open(m.length?"Some files were filtered out. This drop location only accepts file types: "+p:"This drop location only accepts file types: "+p,null,{duration:5e3})}return m}static#t=this.\u0275fac=function(t){return new(t||u)(_.GI1(_.GMv),_.GI1(_.WW2),_.GI1(h.yS))};static#e=this.\u0275dir=_.Sc5({type:u,selectors:[["","appDragAndDrop",""]],hostBindings:function(t,c){1&t&&_.qCj("drop",function(p){return c.onDrop(p)})},inputs:{markStyle:"markStyle",allowedFileTypes:"allowedFileTypes"},outputs:{filesDropped:"filesDropped"},features:[_.eg9]})}return u})()}}]);
//# sourceMappingURL=https://sources.2sxc.org/17.04.00/dist/ng-edit/projects_eav-ui_src_app_content-import_content-import_component_ts.81ee9b1b1a0deef0.js.map