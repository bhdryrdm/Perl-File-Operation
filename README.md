
Açıklama;

Bu dökümantasyona https://bhdryrdm.gitbooks.io/perl-filesdatabase/content/ adresinden formatlı bir şekilde ulaşabilirsiniz.

Saygılarımla 

Bahadır Yardım


------------------------------------- Path Operation ---------------------------------------- 
	PathOperation.pl perl betiği sürekli dosya yolu verme problemini ortadan kaldırmak için gerekli olan bir betiktir.
	
	Örnek;
	
		perl PathOperation.pl <DatabasePath> <DatabaseName>
	
	Betik çalışılan dizin içerisine Paths.txt dosyası oluşturacak ve verilen Veritabanını ismi ve dosya yolu ile kayıt edecektir.
	ConnectionString gibi düşünülebilir.


	
	
	
	
	
------------------------------------- Create Database ----------------------------------------

	CreateDatabase.pl perl betiği verilen dosya yoluna bir klasör oluşturur.
	
	Örnek;
		
		perl CreateDatabase.pl <DatabasePath>
		
		perl CreateDatabase.pl C:\PerlDB

		
		
		
		
		
		
---------------------------------------- Delete Database --------------------------------------
	
	DeleteDatabase.pl perl betiği parametre olarak verilen Database isminden klasörü yabi Database siler.
	
	Örnek;
	
		perl DeleteDatabase.pl <DatabaseName>
	
		perl DeleteDatabase.pl PerlDB
	Eğer silinmek istenen Database yani klasör boş değilse bir uyarı verecek ve kullanıcıdan işlemin devam etmesi için 'Y' tuşuna basılmasını isteyecektir.
	Bu durumu göz ardı etmek için lütfen betik için ikinci parametre olarak --force yazınız.

	Örnek;

		perl DeleteDatabase.pl PerlDB --force
	
	--force parametresi Database yani klasörün dolu yada boş olduğunu kontrol etmeksizin silecektir.
	
	
	
	
	
	
	
	
----------------------------------------- Create Table --------------------------------------------------
	
	CreateTable.pl perl betiği verilen Veritabanı(Klasör) içerisine Tablo(Dosya) oluşturur.
	
	Örnek;
		
		perl CreateTable.pl <DatabaseName> <TableName> --columns --pk <PK_ColumnName> <ColumnName> <ColumnName> ...
		
		perl CreateTable.pl University Student --columns --pk StudentID StudentName StudentSurname ...	

		
		
		
		
		
		
		
		
--------------------------------------- Delete Table ----------------------------------------------------
	
	DeleteTable.pl perl betiği verilen Veritabanı(Klasör) içerisinden Tablo(Dosya) siler.
	
	Örnek;
	
		perl DeleteTable.pl <DatabaseName> <TableName>
	
	Not : Dosyanın dolu yada boş olduğu kontrolü yapılmaksızın Tablo(Dosya) silinecektir

	
	
	
	
	
	
	
	
	
--------------------------------------- Insert Into -----------------------------------------------------

	InsertInto.pl perl betiği verilen Tablo içersine kayıt eklenmesini sağlar.
	
	Örnek;
		
		perl InsertInto.pl  <DatabaseName> <TableName> <ColumnName> <Data> <ColumnName> <Data>...
		
		perl InsertInto.pl  University Student StudentName Bahadır StudentSurname Yardım ...
		
	Not1: Lütfen --pk ile işaretlenmiş olan sütun için veri girmeyiniz.Otomatik artan şekilde ayarlanmıştır.
	Not2: Lütfen tüm sütunlara değer ataması yapınız.Boş olmasını istediğiniz takdirde NULL ibaresini kullanabilirsiniz.
	
	
	
	
	
	
	
	
	
----------------------------------------- Search Table --------------------------------------------------

	SearchTable.pl perl betiği verilen Veritabanı(Klasör) içerisinden Tablo(Dosya) varlığının kontrolünü sağlar.
	Örnek;
	
		perl SearchTable.pl <DatabaseName> <TableName>
	
	Not : Tablonun varlığı kontrol edildikten sonra eğerki varsa geriye dosya yolunu da dönecektir.


