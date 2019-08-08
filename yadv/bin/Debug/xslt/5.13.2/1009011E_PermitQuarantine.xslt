<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru perq" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:perq="urn:customs.ru:Information:SertifDocuments:PermitQuarantine:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template name="Date2">
      <xsl:value-of select="substring (., 9, 2)"/>.
					<xsl:value-of select="substring(., 6, 2)"/>.
					<xsl:value-of select="substring(., 1, 4)"/>
   </xsl:template>
   <xsl:template name="Address">
      <xsl:if test="cat_ru:PostalCode">
         <xsl:value-of select="cat_ru:PostalCode"/> 
	</xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/> 
	</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:value-of select="cat_ru:Region"/> 
	</xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:value-of select="cat_ru:City"/> 
	</xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="perq:PermitQuarantine">
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
         <table style="width:170mm">
            <tr>
               <td align="right" class="graph8" colspan="2">Регистрационный номер</td>
            </tr>
            <tr>
               <td align="right" class="graph10" colspan="2"/>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Федеральная служба по ветеринарному и фитосанитарному надзору (Россельхознадзор)</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Управление Россельхознадзора по <xsl:value-of select="perq:NameSubject"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование субъекта Российской Федерации)</td>
            </tr>
            <tr>
               <td align="center" class="graph12" colspan="2">Импортное карантинное разрешение № 
				<xsl:value-of select="perq:RegistrationNumber"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" style="width:85mm">Выдано:  
					<xsl:for-each select="perq:IssueDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
               <td class="graph10" style="width:85mm"> 
					Действительно до:  
					<xsl:for-each select="perq:ExpirationDate">
                     <xsl:call-template name="Date"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr class="graph8">
               <td align="center">(дата регистрации ИКР)</td>
               <td align="center">(дата окончания срока действия ИКР)</td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Настоящим разрешается: 
					<xsl:value-of select="perq:DeclarantInfo/cat_ru:OrganizationName"/> 
					<xsl:for-each select="perq:DeclarantInfo/cat_ru:Address">
                     <xsl:call-template name="Address"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8" colspan="2">(наименование и адрес организации)</td>
            </tr>
            <tr class="graph10">
               <td colspan="2">ввоз в Российскую Федерацию из государства: 
					<xsl:value-of select="perq:SenderCountry"/>
               </td>
            </tr>
            <tr class="graph8">
               <td align="center" colspan="2">(название страны)</td>
            </tr>
            <tr class="graph10">
               <td colspan="2">
                  <xsl:for-each select="perq:Goods">
			/<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>/
			<xsl:for-each select="cat_ru:GoodsDescription">
                        <xsl:value-of select="."/> 
			</xsl:for-each>/			
			<xsl:value-of select="cat_ru:GrossWeightQuantity"/>;
			</xsl:for-each>
               </td>
            </tr>
            <tr class="graph8">
               <td colspan="2">1. Ввозимая подкарантиннная продукция (подкарантинный материал, подкарантинный груз), тара, упаковка и транспортные средства должны быть свободны от вредителей растений, возбудителей болезней растений (сорянков), имеющих карантинное значение для Российской Федерации в том числе следующих характерных для разрешенной к ввозу продукции, видов:</td>
            </tr>
            <tr class="graph10">
               <td colspan="2">
                  <xsl:value-of select="perq:ListProhibitedGoods"/>
               </td>
            </tr>
            <tr/>
            <tr/>
            <tr class="graph10">
               <td colspan="2">и отвечать следующим дополнительным фитосанитарным требованиям:</td>
            </tr>
            <tr class="graph10">
               <td colspan="2">
                  <xsl:for-each select="perq:AdditionalRequirements">
                     <xsl:value-of select="."/> 
						</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Наименование пунктов пропуска, через которые осуществляется ввоз продукции 
					<xsl:value-of select="perq:NameCheckpoint"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Маршрут перевозки до места назначения 
					<xsl:for-each select="perq:TransportationRoute">
                     <xsl:value-of select="."/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Карантинные фитосанитарные мероприятия, которые должны быть проведены в пунктах пропуска через государственную границу РФ и по месту назначения 
					<xsl:for-each select="perq:ActionCheckpoint">
                     <xsl:value-of select="."/> 
					</xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">Сведения о заявке, на основании которой было выдано разрешение 
					<xsl:value-of select="perq:ApplicationInfo/cat_ru:PrDocumentName"/> 
					<xsl:value-of select="perq:ApplicationInfo/cat_ru:PrDocumentNumber"/> 
					<xsl:for-each select="perq:ApplicationInfo/cat_ru:PrDocumentDate">
					от <xsl:call-template name="Date2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">
                  <xsl:value-of select="perq:IssuePerson/cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">Подпись ________________________</td>
               <td class="graph10">Фамилия 
					<xsl:value-of select="perq:IssuePerson/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="perq:IssuePerson/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="perq:IssuePerson/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
