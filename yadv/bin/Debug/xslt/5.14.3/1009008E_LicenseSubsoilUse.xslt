<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru lsu" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:lsu="urn:customs.ru:Information:SertifDocuments:LicenseSubsoilUse:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
      <xsl:value-of select="substring (., 9, 2)"/>
      <xsl:text>.</xsl:text>
	  <xsl:value-of select="substring(., 6, 2)"/>
      <xsl:text>.</xsl:text>
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
   <xsl:template match="lsu:LicenseSubsoilUse">
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
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    </style>
         <div class="page">
            <table style="width:170mm">
               <tr>
                  <td align="center" class="graph10" colspan="3">
                     <xsl:value-of select="lsu:LicensingAuthority"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(наименование органа, выдавшего лицензию)</td>
               </tr>
               <tr>
                  <td align="center" class="graph12" colspan="3">
                     <br>ЛИЦЕНЗИЯ</br>
                     <br>на пользование недрами</br>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph10">
                     <table class="items">
                        <tr>
                           <xsl:for-each select="lsu:RegistrationNumber/lsu:Series">
                              <td>
                                 <xsl:value-of select="substring(., 1, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 2, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 3, 1)"/>
                              </td>
                           </xsl:for-each>
                        </tr>
                     </table>
                  </td>
                  <td align="center" class="graph10">
                     <table class="items">
                        <tr>
                           <xsl:for-each select="lsu:RegistrationNumber/lsu:Number">
                              <td>
                                 <xsl:value-of select="substring(., 1, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 2, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 3, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 4, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 5, 1)"/>
                              </td>
                           </xsl:for-each>
                        </tr>
                     </table>
                  </td>
                  <td align="center" class="graph10">
                     <table class="items">
                        <tr>
                           <xsl:for-each select="lsu:RegistrationNumber/lsu:LicenseType">
                              <td>
                                 <xsl:value-of select="substring(., 1, 1)"/>
                              </td>
                              <td>
                                 <xsl:value-of select="substring(., 2, 1)"/>
                              </td>
                           </xsl:for-each>
                        </tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph10">серия</td>
                  <td align="center" class="graph10">номер</td>
                  <td align="center" class="graph10">вид лицензии</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Выдана 
					<xsl:value-of select="lsu:OrganizationReceiver/cat_ru:OrganizationName"/>,  
					<xsl:for-each select="lsu:OrganizationReceiver/cat_ru:Address">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(субъект предпринимательской деятельности, получивший данную лицензию)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">в лице 
					<xsl:value-of select="lsu:RepresentativeOrganization/cat_ru:PersonPost"/>,  
					<xsl:value-of select="lsu:RepresentativeOrganization/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="lsu:RepresentativeOrganization/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="lsu:RepresentativeOrganization/cat_ru:PersonMiddleName"/>,  
					</td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(Ф.И.О. лица, представляющего субъект предпринимательской деятельности)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">с целевым назначением и видами работ 
					<xsl:for-each select="lsu:Aim"> 
					<xsl:value-of select="."/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Участок недр расположен 
					<xsl:for-each select="lsu:LocationArea">
                        <xsl:call-template name="Address"/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(наименование населенного пункта, района, области, края, республики)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Описание    границ    участка    недр,   координаты  угловых  точек,  копии
топопланов, разрезов и др. приводятся в приложении 
	<xsl:for-each select="lsu:Application[lsu:KIndApplication = 'false' or lsu:KIndApplication = 'f' or lsu:KIndApplication = '0' ]">
                        <xsl:value-of select="lsu:NumberApplication"/>; 
</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(N прилож.)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Право на пользование земельными участками получено от 
					<xsl:for-each select="lsu:RightSubsoilUse">
                        <xsl:value-of select="."/> 
					</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(наименование органа, выдавшего разрешение, номер постановления, дата)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">
					Копии документов и описание границ земельного участка приводятся в приложении 
					<xsl:for-each select="lsu:Application[lsu:KIndApplication = 'true' or lsu:KIndApplication = 't'  or lsu:KIndApplication = '1' ]">
                        <xsl:value-of select="lsu:NumberApplication"/> 
на <xsl:value-of select="lsu:SheetApplication"/> листах; 
</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(N прилож.)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Участок недр имеет статус 
					<xsl:variable name="type" select="lsu:StatusArea"/>
                     <xsl:choose>
                        <xsl:when test="$type='1'">
						геологического отвода
					</xsl:when>
                        <xsl:when test="$type='0' ">
					горного отвода
					</xsl:when>
                     </xsl:choose>
                  </td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">Дата окончания действия лицензии 
					<xsl:for-each select="lsu:EndDate">
                        <xsl:call-template name="Date_2"/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="3">(число, месяц, год)</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="3">
                     <br>Место штампа</br>
                     <br>государственной регистрации</br>
                  </td>
               </tr>
            </table>
         </div>
         <div class="page">
            <table style="width:170mm">
               <tr>
                  <td class="graph10" colspan="4">Неотъемлемыми  составными частями настоящей лицензии являются следующие
документы (приложения): </td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">1. Условия пользования недрами, на 
					<xsl:value-of select="lsu:Verso/lsu:TermsSubsoil"/>
					 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">2.  Копия  решения,  являющегося  основанием  предоставления  лицензии,
принятого  в  соответствии  со  статьей 10.1 Закона Российской Федерации "О
недрах" на 
<xsl:value-of select="lsu:Verso/lsu:CopySolutions"/>
 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">3. Схема расположения участка недр на 
					<xsl:value-of select="lsu:Verso/lsu:LocationPlot"/>
					 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4"> 4.  Копия свидетельства о государственной регистрации юридического лица
на 
<xsl:value-of select="lsu:Verso/lsu:CopyJuridicalPersonRegistrationCertificate"/>
 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">5. Копия свидетельства о постановке пользователя недр на налоговый учет
на 
<xsl:value-of select="lsu:Verso/lsu:CopyTaxOrganRegistrationCertificate"/>
 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4"> 6.   Документ   на 
<xsl:value-of select="lsu:Verso/lsu:AreaInfo"/>					
					 л.,  содержащий  сведения  об   участке  недр,
отражающие:</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">местоположение участка недр в административно-территориальном отношении
с  указанием границ особо охраняемых природных территорий, а также участков
ограниченного  и  запрещенного  землепользования  с  отражением их на схеме
расположения участка недр;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">геологическую   характеристику   участка   недр   с  указанием  наличия
месторождений (залежей) полезных ископаемых и запасов (ресурсов) по ним;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">обзор работ, проведенных ранее на участке недр, наличие на участке недр
горных  выработок, скважин и иных объектов, которые могут быть использованы
при работе на этом участке;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">сведения  о  добытых полезных ископаемых за период пользования участком
недр (если ранее производилась добыча полезных ископаемых);</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">наличие других пользователей недр в границах данного участка недр;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4"> 7.  Перечисление  предыдущих  пользователей  данным участком недр (если ранее  участок  недр находился в пользовании) с указанием оснований, сроков предоставления  (перехода права)  участка недр в пользование и прекращения действия  лицензии  на  пользование  этим  участком  недр (указывается при переоформлении лицензии), на 
<xsl:value-of select="lsu:Verso/lsu:ListPreviousUser"/>
 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">8.  Краткая  справка о пользователе недр, содержащая: юридический адрес пользователя недр, банковские реквизиты, контактные телефоны, на 
<xsl:value-of select="lsu:Verso/lsu:UserInfo"/>
 л.;</td>
               </tr>
               <tr>
                  <td class="graph10" colspan="4">9. Иные приложения 
					<xsl:for-each select="lsu:Verso//lsu:OtherApplications">
                        <xsl:value-of select="lsu:NameDocument"/>, 
					<xsl:value-of select="lsu:NumberSheets"/>; 
					</xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="4">(название документов, количество страниц)</td>
               </tr>
               <xsl:for-each select="lsu:PersonIssuingSignature">
                  <tr>
                     <td class="graph10">Уполномоченное должностное лицо органа, выдавшего лицензию</td>
                     <td class="graph10">
                        <xsl:value-of select="cat_ru:PersonPost"/>
                     </td>
                     <td class="graph10">_____________________</td>
                     <td class="graph10">
                        <xsl:value-of select="cat_ru:PersonSurname"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonName"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph10"/>
                     <td class="graph8">должность</td>
                     <td class="graph8">Подпись</td>
                     <td class="graph8">Фамилия, имя, отчетство</td>
                  </tr>
                  <tr>
                     <td colspan="2"/>
                     <td align="center" class="graph10" colspan="2">
                        <xsl:for-each select="cat_ru:IssueDate">
                           <xsl:call-template name="Date_2"/>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td align="right" class="graph10" colspan="2">М.П</td>
                     <td align="center" class="graph10" colspan="2">дата</td>
                  </tr>
               </xsl:for-each>
               <tr>
                  <td align="center" class="graph10" colspan="4">Руководитель предприятия, получающего лицензию</td>
               </tr>
               <tr>
                  <td align="center" class="graph10" colspan="4">
                     <xsl:value-of select="lsu:SuperiorsSignature/cat_ru:PersonPost"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph10" colspan="4">
                     <xsl:value-of select="lsu:SuperiorsSignature/cat_ru:PersonSurname"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="lsu:SuperiorsSignature/cat_ru:PersonName"/>
                     <xsl:text> </xsl:text>
                     <xsl:value-of select="lsu:SuperiorsSignature/cat_ru:PersonMiddleName"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="4">Фамилия, имя, отчетство</td>
               </tr>
               <tr>
                  <td align="center" class="graph10" colspan="4">______________________</td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="4">Подпись</td>
               </tr>
               <tr>
                  <td align="center" class="graph10" colspan="4">
                     <xsl:for-each select="lsu:SuperiorsSignature/cat_ru:IssueDate">
                        <xsl:call-template name="Date_2"/>
                     </xsl:for-each>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="graph8" colspan="4">Дата</td>
               </tr>
            </table>
         </div>
      </html>
   </xsl:template>
</xsl:stylesheet>
