<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru catTrans_ru crsf" version="1.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:crsf="urn:customs.ru:Information:TransportDocuments:Sea:CertificateRightStateFlag:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="crsf:CertificateRightStateFlag">
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
                    </style>
         <table width="600mm">
            <tr>
               <td align="center" class="graph12">РОССИЙСКАЯ ФЕДЕРАЦИЯ</td>
            </tr>
            <tr>
               <td align="center" class="graph12">
                  <br>СВИДЕТЕЛЬСТВО</br>
                  <br>о праве плавания под</br>
                  <br>Государственным флагом Российской Федерации</br>
               </td>
            </tr>
            <tr>
               <td class="graph10">На основании данных, внесенных в Государственный судовой реестр Российской Федерации под № 
				<xsl:value-of select="crsf:Register/crsf:NumberRegister"/>
				от 
				<xsl:for-each select="crsf:Register/crsf:DateRegister">
                     <xsl:call-template name="Date"/>, 
				</xsl:for-each>
				принадлежит 
				<xsl:value-of select="crsf:Shipowner/cat_ru:OrganizationName"/> 
				<xsl:for-each select="crsf:Shipowner/crsf:PostalAddress">
                     <xsl:call-template name="Address"/> 
				</xsl:for-each>
                  <xsl:for-each select="crsf:Shipowner/crsf:LocationPlace">
                     <xsl:call-template name="Address"/>, 
				</xsl:for-each>
				разрешается плавать под Государственным флагом Российской Федерации.
				</td>
            </tr>
            <tr>
               <td align="center" class="graph12">Данные судна</td>
            </tr>
            <tr>
               <td class="graph10">1. Идентификационный номер судна 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:IDVessel"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">2. Название судна или его номер 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Name"/> 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:RegNumder"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">3. Тип и назначение 
				<xsl:for-each select="crsf:Vessel/catTrans_ru:TypeFunction">
                     <xsl:value-of select="."/> 
				</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">4. Класс судна 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Class"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">5. Проект № 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Project"/> , год и место постройки 
				<xsl:for-each select="crsf:Vessel/catTrans_ru:Year">
                     <xsl:value-of select="substring(., 1, 4)"/> г. 
				</xsl:for-each>
                  <xsl:value-of select="crsf:Vessel/catTrans_ru:Place"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">6. Материал корпуса 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:HousingMaterial"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">7. Главные машины 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:MainMachine/catTrans_ru:Type"/>, 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:MainMachine/catTrans_ru:Quantity"/>, 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:MainMachine/catTrans_ru:Power"/>
               </td>
            </tr>
            <tr>
               <td class="graph8">(тип, число, общая мощность)</td>
            </tr>
            <tr>
               <td class="graph10">8. Габаритные размеры судна: </td>
            </tr>
            <tr>
               <td class="graph10">длина 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Dimensions/catTrans_ru:Lenght"/>
				 (м)</td>
            </tr>
            <tr>
               <td class="graph10">ширина 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Dimensions/catTrans_ru:Wight"/>
						 (м)</td>
            </tr>
            <tr>
               <td class="graph10">осадка в полном грузу 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Dimensions/catTrans_ru:FullyLoaded"/>
						 (м)</td>
            </tr>
            <tr>
               <td class="graph10">осадка порожнем 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Dimensions/catTrans_ru:Empty"/>
						 (м)</td>
            </tr>
            <tr>
               <td class="graph10">наибольшая высота с надстройками
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Dimensions/catTrans_ru:MaximumHeight"/>
		 (м)</td>
            </tr>
            <tr>
               <td class="graph10">(от осадки порожнем)</td>
            </tr>
            <tr>
               <td class="graph10">9. Установленная грузоподъемность 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Capacity"/>
				 (т), пассажировместимость 	
				<xsl:value-of select="crsf:Vessel/catTrans_ru:Passenger"/>
				 (чел.)</td>
            </tr>
            <tr>
               <td class="graph10">10. Прежнее название судна и прежнее место приписки 
				<xsl:value-of select="crsf:Vessel/catTrans_ru:PreviousName"/> 
				<xsl:for-each select="crsf:Vessel/catTrans_ru:PreviousPlaceResidence">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">Свидетельство хранится в подлиннике у судовладельца (копия на судне).</td>
            </tr>
            <tr>
               <td class="graph10">Настоящее Свидетельство выдано Государственной речной судоходной инспекцией по 
				<xsl:value-of select="crsf:IssuedInspectorate"/> 
				бассейну.</td>
            </tr>
            <tr>
               <td class="graph10">Начальник Государственной речной судоходной инспекции по 
				<xsl:value-of select="crsf:IssuedInspectorate"/>
						 бассейну</td>
            </tr>
         </table>
         <table width="600mm">
            <tr>
               <td class="graph10" width="300">____________________</td>
               <td class="graph10" width="300">
                  <xsl:value-of select="crsf:SignatureChief/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="crsf:SignatureChief/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="crsf:SignatureChief/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10"/>
               <td class="graph10">М.П.</td>
            </tr>
            <tr>
               <td class="graph10">
                  <xsl:for-each select="crsf:SignatureChief/cat_ru:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
               <td class="graph10"/>
            </tr>
            <tr>
               <td align="center" class="graph10" colspan="2">РТ-II № 
				<xsl:value-of select="crsf:RegistrationNumber"/>
               </td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
