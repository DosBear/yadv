<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru aqfsc" version="1.0" xmlns:aqfsc="urn:customs.ru:Information:CustomsDocuments:ActQuarantineFitoSanControl:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
   <xsl:template name="Date">
      <xsl:value-of select="substring (., 9, 2)"/> 
					<xsl:variable name="month" select="substring(., 6, 2)"/>
      <xsl:choose>
         <xsl:when test="$month=1">января</xsl:when>
         <xsl:when test="$month=2">февраля</xsl:when>
         <xsl:when test="$month=3">марта</xsl:when>
         <xsl:when test="$month=4">апреля</xsl:when>
         <xsl:when test="$month=5">мая</xsl:when>
         <xsl:when test="$month=6">июня</xsl:when>
         <xsl:when test="$month=7">июля</xsl:when>
         <xsl:when test="$month=8">августа</xsl:when>
         <xsl:when test="$month=9">сентября</xsl:when>
         <xsl:when test="$month=10">октября</xsl:when>
         <xsl:when test="$month=11">ноября</xsl:when>
         <xsl:when test="$month=12">декабря</xsl:when>
      </xsl:choose> 					
					<xsl:value-of select="substring(., 1, 4)"/> г.
	</xsl:template>
   <xsl:template name="Date_2">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/>, 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="aqfsc:ActQuarantineFitoSanControl">
      <html>
         <META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
         <style type="text/css">
                    body {}
                    div.page {
                        width: 210mm;
                        margin: auto;
                        margin-top: 6pt;
                        margin-bottom: 6pt;
                        padding: 10mm;
                        padding-left: 20mm;
                        background: #ffffff;
                        border: solid 1pt #000000;
                    }

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;                    
                    }
                    table.items {font-size: 9pt; border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; text-align: center; font-family: Arial; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    
                    </style>
         <table style="width:170mm">
            <tr>
               <td align="center" class="graph12" colspan="2"> ФЕДЕРАЛЬНАЯ СЛУЖБА ПО ВЕТЕРИНАРНОМУ И ФИТОСАНИТАРНОМУ НАДЗОРУ</td>
            </tr>
            <tr>
               <td align="center" class="graph10" colspan="2">Управление Россельхознадзора по 
				<xsl:value-of select="aqfsc:NameSubject"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph10" colspan="2">
                  <xsl:value-of select="aqfsc:NameManagement"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">
                  <br>АКТ</br>
                  <br>ГОСУДАРСТВЕННОГО КАРАНТИННОГО ФИТОСАНИТАРНОГО КОНТРОЛЯ</br>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph10" style="width:85mm">от 
				<xsl:for-each select="aqfsc:IssueDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
               <td align="center" class="graph10" style="width:85mm">N 
				<xsl:value-of select="aqfsc:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(дата выдачи)</td>
               <td align="center" class="graph10"/>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Мною,  уполномоченным  должностным лицом Федеральной службы по ветеринарному и фитосанитарному надзору 
<xsl:value-of select="aqfsc:AuthorizedOfficial/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="aqfsc:AuthorizedOfficial/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="aqfsc:AuthorizedOfficial/cat_ru:PersonMiddleName"/> 
проведен карантинный фитосанитарный контроль 
</td>
            </tr>
         </table>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center" class="graph10" style="width:59mm">наименование продукции, грузов, материалов, транспортных средств, количество, вес, сведения об обеззараживании, месте нахождения и т.д.</td>
               <td align="center" class="graph10" style="width:26mm">количество мест</td>
               <td align="center" class="graph10" style="width:42.5mm">товары прибыли из</td>
               <td align="center" class="graph10" style="width:42.5mm">страна происхождения</td>
            </tr>
            <xsl:for-each select="aqfsc:DescriptionConsignment">
               <tr>
                  <td class="graph10">
                     <xsl:value-of select="aqfsc:GoodsDescription"/>, 
<xsl:value-of select="aqfsc:GoodsQuantity"/>, 
<xsl:value-of select="aqfsc:GoodsWeightQuantity"/>, 
<xsl:for-each select="aqfsc:LocationPlace">
                        <xsl:call-template name="Address"/>, 
</xsl:for-each>
                     <xsl:for-each select="aqfsc:DesinfestationInfo">
                        <xsl:for-each select="aqfsc:DateDesinfestation">
                           <xsl:call-template name="Date_2"/> 
</xsl:for-each>
                        <xsl:value-of select="aqfsc:TreatmentMethod"/> 
<xsl:value-of select="aqfsc:Chemical"/> 
<xsl:value-of select="aqfsc:Duration"/> 
<xsl:value-of select="aqfsc:Temperature"/> 
<xsl:value-of select="aqfsc:Concentration"/>
                     </xsl:for-each>
                  </td>
                  <td class="graph10">
                     <xsl:value-of select="aqfsc:QuantityPlace"/>
                  </td>
                  <td class="graph10">
                     <xsl:value-of select="aqfsc:Arrival/aqfsc:CountryName"/>, 
<xsl:value-of select="aqfsc:Arrival/aqfsc:RegionName"/>
                  </td>
                  <td class="graph10">
                     <xsl:value-of select="aqfsc:Origin/aqfsc:CountryName"/>,
<xsl:value-of select="aqfsc:Origin/aqfsc:RegionName"/> 
</td>
               </tr>
            </xsl:for-each>
         </table>
         <table style="width:170mm">
            <tr>
               <td class="graph10" colspan="4">на основании ИКР N 
				<xsl:value-of select="aqfsc:NumberIKR"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">по фитосанитарному (карантинному) сертификату: 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/cat_ru:PrDocumentName"/>
                  <xsl:if test="aqfsc:FitoSanitaryCertificateInfo/cat_ru:PrDocumentNumber">
				№ <xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/cat_ru:PrDocumentNumber"/>
                  </xsl:if>
                  <xsl:for-each select="aqfsc:FitoSanitaryCertificateInfo/cat_ru:PrDocumentDate">
				от <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">выданному: 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:IssueOrganization"/>
               </td>
            </tr>
            <tr>
               <td class="graph8" colspan="4">(наименование органа, выдавшего сертификат)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">экспортер (отправитель): 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Sender/cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">импортер (получатель): 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Receiver/cat_ru:OrganizationName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Сведения по обеззараживанию груза: 
				<xsl:for-each select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:DateDesinfestation">
                     <xsl:call-template name="Date_2"/> 
				</xsl:for-each>
                  <xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:TreatmentMethod"/> 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:Chemical"/> 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:Duration"/> 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:Temperature"/> 
				<xsl:value-of select="aqfsc:FitoSanitaryCertificateInfo/aqfsc:Desinfestation/aqfsc:Concentration"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">В результате досмотра установлено: 
				<xsl:for-each select="aqfsc:ResultScreening">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Для карантинной фитосанитарной экспертизы отобраны образцы: 
				<xsl:value-of select="aqfsc:ConfiscationSamples"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Образцы  после   проведения   экспертизы: 
				<xsl:variable name="act" select="aqfsc:ReturnDestructionSamples"/>
                  <xsl:choose>
                     <xsl:when test="$act=1">
					возвращены
					</xsl:when>
                     <xsl:when test="$act=2">
					уничтожены
					</xsl:when>
                     <xsl:when test="$act=3">
					оставлены на хранение
					</xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Предписываются следующие карантинные  фитосанитарные  мероприятия, условия хранения и использования: 
<xsl:for-each select="aqfsc:Prescription">
                     <xsl:value-of select="."/> 
</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="4">Акт составлен  в  присутствии  владельца   (представителя)   груза (транспорта): 
<xsl:value-of select="aqfsc:Owner/cat_ru:PersonPost"/> 
<xsl:value-of select="aqfsc:Owner/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="aqfsc:Owner/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="aqfsc:Owner/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
