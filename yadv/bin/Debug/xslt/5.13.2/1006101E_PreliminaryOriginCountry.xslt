<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru porc" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:porc="urn:customs.ru:Information:CustomsDocuments:PreliminaryOriginCountry:5.13.2" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="porc:PreliminaryOriginCountry">
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
                        font-size: 10pt; }

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 1px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                     table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    </style>
         <table class="items" style="width:170mm">
            <tr>
               <td align="center" class="graph12" colspan="2">Предварительное решение о стране происхождения товара</td>
            </tr>
            <tr>
               <td class="graph10" style="width:85mm">1. Наименование таможенного органа, выдавшего предварительное решение 
				<xsl:value-of select="porc:ManagementName"/>
               </td>
               <td class="graph10" style="width:85mm">2. Заявитель 
				<xsl:value-of select="porc:Declarant/cat_ru:OrganizationName"/> 
				<xsl:for-each select="porc:Declarant/cat_ru:Address">
                     <xsl:call-template name="Address"/> 
				</xsl:for-each>
                  <xsl:value-of select="porc:Declarant/porc:Chief/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="porc:Declarant/porc:Chief/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="porc:Declarant/porc:Chief/cat_ru:PersonMiddleName"/> 
				<xsl:value-of select="porc:Declarant/porc:Chief/cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td class="graph10">3. Регистрационный номер 
				<xsl:value-of select="porc:RegistrationNumber/porc:IndexManagement"/>-
				<xsl:value-of select="porc:RegistrationNumber/porc:CaseNumber"/>/
				<xsl:value-of select="porc:RegistrationNumber/porc:SerialNumber"/>
               </td>
               <td class="graph10">4. Дата принятия (число, месяц, год) 
				<xsl:for-each select="porc:Date">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10">5. Наименование товара  
				<xsl:for-each select="porc:Goods">
                     <xsl:for-each select="porc:GoodDescription">
                        <xsl:value-of select="."/>  
				</xsl:for-each>
                  </xsl:for-each>
               </td>
               <td class="graph10">6. Страна происхождения товара 
				<xsl:value-of select="porc:OriginCountryName"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">7. Сведения о товаре, необходимые для определения страны происхождения 
				<xsl:value-of select="porc:GoodsInfoOriginCountry/porc:Manufacturer"/> 
				<xsl:value-of select="porc:GoodsInfoOriginCountry/porc:PlaceManufactur"/> 
				<xsl:value-of select="porc:GoodsInfoOriginCountry/porc:Contract/cat_ru:PrDocumentName"/> 
				<xsl:value-of select="porc:GoodsInfoOriginCountry/porc:Contract/cat_ru:PrDocumentNumber"/> 
				<xsl:for-each select="porc:GoodsInfoOriginCountry/porc:Contract/cat_ru:PrDocumentDate">
                     <xsl:call-template name="Date_2"/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">8. Обоснование принятия решения 
				<xsl:value-of select="porc:Document"/>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">9. Для служебных отметок 
				<xsl:for-each select="porc:Mark">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
               </td>
            </tr>
            <tr>
               <td class="graph10" colspan="2">10. Подпись должностного лица таможенного органа </td>
            </tr>
            <tr>
               <td align="center" class="graph10">
                  <xsl:value-of select="porc:PersonSignature/cat_ru:PersonPost"/>   ____________ 
				</td>
               <td align="center" class="graph10">
                  <xsl:value-of select="porc:PersonSignature/cat_ru:PersonSurname"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="porc:PersonSignature/cat_ru:PersonName"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="porc:PersonSignature/cat_ru:PersonMiddleName"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph8">(должность)     (подпись)</td>
               <td align="center" class="graph8">(инициалы, фамилия)</td>
            </tr>
         </table>
      </html>
   </xsl:template>
</xsl:stylesheet>
