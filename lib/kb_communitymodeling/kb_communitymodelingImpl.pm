package kb_communitymodeling::kb_communitymodelingImpl;
use strict;
use Bio::KBase::Exceptions;
# Use Semantic Versioning (2.0.0-rc.1)
# http://semver.org
our $VERSION = '0.0.1';
our $GIT_URL = '';
our $GIT_COMMIT_HASH = '';

=head1 NAME

kb_communitymodeling

=head1 DESCRIPTION

A KBase module: kb_communityinteractions
This module predict trophic interactions.

=cut

#BEGIN_HEADER
use Bio::KBase::AuthToken;
use KBaseReport::KBaseReportClient;
use fba_tools::fba_toolsClient;
use installed_clients::RAST_SDKClient;
use Config::IniFiles;
use Bio::SeqIO;
use UUID::Random;
use Data::Dumper;
#END_HEADER

sub new
{
    my($class, @args) = @_;
    my $self = {
    };
    bless $self, $class;
    #BEGIN_CONSTRUCTOR

    my $config_file = $ENV{ KB_DEPLOYMENT_CONFIG };
    my $cfg = Config::IniFiles->new(-file=>$config_file);
    my $scratch = $cfg->val('kb_communitymodeling', 'scratch');
    my $wsInstance = $cfg->val('kb_communitymodeling','workspace-url');
    my $callbackURL = $ENV{ SDK_CALLBACK_URL };

    $self->{scratch} = $scratch;
    $self->{callbackURL} = $callbackURL;
    $self->{'workspace-url'} = $wsInstance;

    #END_CONSTRUCTOR

    if ($self->can('_init_instance'))
    {
	$self->_init_instance();
    }
    return $self;
}

=head1 METHODS



=head2 predict_trophic_interactions

  $output = $obj->predict_trophic_interactions($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a kb_communitymodeling.trophicInteractionInput
$output is a kb_communitymodeling.trophicInteractionOutput
trophicInteractionInput is a reference to a hash where the following keys are defined:
	workspace has a value which is a string
	model_ref has a value which is a string
trophicInteractionOutput is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a kb_communitymodeling.trophicInteractionInput
$output is a kb_communitymodeling.trophicInteractionOutput
trophicInteractionInput is a reference to a hash where the following keys are defined:
	workspace has a value which is a string
	model_ref has a value which is a string
trophicInteractionOutput is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text



=item Description



=back

=cut

sub predict_trophic_interactions
{
    my $self = shift;
    my($params) = @_;

    my @_bad_arguments;
    (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"params\" (value was \"$params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to predict_trophic_interactions:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'predict_trophic_interactions');
    }

    my $ctx = $kb_communitymodeling::kb_communitymodelingServer::CallContext;
    my($output);
    #BEGIN predict_trophic_interactions
    my $token=$ctx->token;
    my $provenance=$ctx->provenance;
    my $wshandle= Workspace::WorkspaceClient->new($self->{'workspace-url'},token=>$token);
    print("Starting communityinteractions. Parameters:\n");
    print(Dumper($params->{input_fba}) . "\n");

    #my $fba_object = $wshandle->get_objects([{workspace=>$template_ws,name=>$templateId->{$k}->[0]}] )->[0]{data};
    #my $fba_object = $wshandle->get_objects2([{ref=>$params->{input_fba}}])->[0]{data};

    my $fba_object = $wshandle->get_objects2( {objects=>[{ref=>$params->{input_fba}}]})->{data}[0]{data}{FBACompoundVariables};
    for (my $i =0; $i< @{$fba_object}; $i++){
        if ($fba_object->[$i]->{variableType} eq 'drainflux'){
            print $fba_object->[$i]->{modelcompound_ref}."\n";
        }
    }

    #print &Dumper ($fba_object);
    die;


    #END predict_trophic_interactions
    my @_bad_returns;
    (ref($output) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"output\" (value was \"$output\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to predict_trophic_interactions:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'predict_trophic_interactions');
    }
    return($output);
}




=head2 meta_genome_model_construction

  $output = $obj->meta_genome_model_construction($params)

=over 4

=item Parameter and return types

=begin html

<pre>
$params is a kb_communitymodeling.metaGenomeModelingInput
$output is a kb_communitymodeling.metaGenomeModelingOutput
metaGenomeModelingInput is a reference to a hash where the following keys are defined:
	workspace has a value which is a string
	genome_ref has a value which is a string
metaGenomeModelingOutput is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string

</pre>

=end html

=begin text

$params is a kb_communitymodeling.metaGenomeModelingInput
$output is a kb_communitymodeling.metaGenomeModelingOutput
metaGenomeModelingInput is a reference to a hash where the following keys are defined:
	workspace has a value which is a string
	genome_ref has a value which is a string
metaGenomeModelingOutput is a reference to a hash where the following keys are defined:
	report_name has a value which is a string
	report_ref has a value which is a string


=end text



=item Description



=back

=cut

sub meta_genome_model_construction
{
    my $self = shift;
    my($params) = @_;

    my @_bad_arguments;
    (ref($params) eq 'HASH') or push(@_bad_arguments, "Invalid type for argument \"params\" (value was \"$params\")");
    if (@_bad_arguments) {
	my $msg = "Invalid arguments passed to meta_genome_model_construction:\n" . join("", map { "\t$_\n" } @_bad_arguments);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'meta_genome_model_construction');
    }

    my $ctx = $kb_communitymodeling::kb_communitymodelingServer::CallContext;
    my($output);
    #BEGIN meta_genome_model_construction
    my $token=$ctx->token;
    my $provenance=$ctx->provenance;
    my $wshandle= Workspace::WorkspaceClient->new($self->{'workspace-url'},token=>$token);

    my $ra = new installed_clients::RAST_SDKClient( $self->{'callbackURL'},
                                                            ( 'service_version' => 'release',
                                                              'async_version' => 'release',
                                                            )
                                                 );
    my $fm = new installed_clients::fba_toolsClient( $self->{'callbackURL'},
                                                            ( 'service_version' => 'release',
                                                              'async_version' => 'release',
                                                            )
                                                 );
     my $reportHandle = new KBaseReport::KBaseReportClient( $self->{'callbackURL'},
                                                            ( 'service_version' => 'release',
                                                              'async_version' => 'release',
                                                            )
                                                          );


    print("Starting metagenome model construction ;Parameters:\n");
    print(Dumper($params->{input_genome}) . "\n");

    #my $fba_object = $wshandle->get_objects([{workspace=>$template_ws,name=>$templateId->{$k}->[0]}] )->[0]{data};
    #my $fba_object = $wshandle->get_objects2([{ref=>$params->{input_fba}}])->[0]{data};

    my $genome_object = $wshandle->get_objects2( {objects=>[{ref=>$params->{input_genome}}]})->{data}[0]{data};

    # print &Dumper ($genome_object);
    #Annoate with RAST
        #The API call is here, but I could not work test locally as it cannot copy the kmer ref data file through sdk call back.

    my $output_genome_rast =  $params->{input_genome}."RAST";
    my $rastAnno = $ra->annotate_genome({

        input_genome => $params->{input_genome},
        output_genome => $output_genome_rast,
        workspace => $params->{workspace},
        call_features_rRNA_SEED => 0,
        call_features_tRNA_trnascan => 0,
        call_selenoproteins => 0,
        call_pyrrolysoproteins => 0,
        call_features_repeat_region_SEED => 0,
        call_features_strep_suis_repeat => 0,
        call_features_strep_pneumo_repeat => 0,
        call_features_crispr => 0,
        call_features_CDS_glimmer3 => 0,
        call_features_CDS_prodigal => 0,
        annotate_proteins_kmer_v2 => 1,
        kmer_v1_parameters => 1,
        annotate_proteins_similarity => 1,
        retain_old_anno_for_hypotheticals => 0,
        resolve_overlapping_features => 0,
        call_features_prophage_phispy => 0

    });

    my $output_fba_model = $output_genome_rast."Model";
    my $new_model = $fm->build_metabolic_model({

        genome_id => $output_genome_rast,
        media_id =>  "",
        fbamodel_output_id =>$output_fba_model,
        template_id => "auto",
        gapfill_model => 1,
        classic_mode => 0,
        use_annotated_functions => 1,
        merge_all_annotations => 0,
        source_ontology_list => [],
        custom_bound_list => [],
        media_supplement_list => [],
        minimum_target_flux => 0.1
    });

    my $stat_string= "Newly constructed model based on the metagenome $output_fba_model \n";
    my $reporter_string = $stat_string;
    my $uid = UUID::Random::generate;
    my $report_context = {
      message => $reporter_string,
      objects_created => [],
      workspace_name => $params->{workspace},
      direct_html_link_index => 0,
      warnings => [],
      html_links => [],
      file_links =>[],
      report_object_name => "Report"."modelconstruction"."-".UUID::Random::generate
    };

    my $report_response;

    eval {
      $report_response = $reportHandle->create_extended_report($report_context);
    };
    if ($@){
      print "Exception message: " . $@->{"message"} . "\n";
      print "JSONRPC code: " . $@->{"code"} . "\n";
      print "Method: " . $@->{"method_name"} . "\n";
      print "Client-side exception:\n";
      print $@;
      print "Server-side exception:\n";
      print $@->{"data"};
      die $@;
    }

    print "Report is generated: name and the ref as follows\n";
    print &Dumper ($report_response);
    my $report_out = {
      report_name => $report_response->{name},
      report_ref => $report_response->{ref}
    };
    return $report_out;


    #END meta_genome_model_construction
    my @_bad_returns;
    (ref($output) eq 'HASH') or push(@_bad_returns, "Invalid type for return variable \"output\" (value was \"$output\")");
    if (@_bad_returns) {
	my $msg = "Invalid returns passed to meta_genome_model_construction:\n" . join("", map { "\t$_\n" } @_bad_returns);
	Bio::KBase::Exceptions::ArgumentValidationError->throw(error => $msg,
							       method_name => 'meta_genome_model_construction');
    }
    return($output);
}




=head2 status

  $return = $obj->status()

=over 4

=item Parameter and return types

=begin html

<pre>
$return is a string
</pre>

=end html

=begin text

$return is a string

=end text

=item Description

Return the module status. This is a structure including Semantic Versioning number, state and git info.

=back

=cut

sub status {
    my($return);
    #BEGIN_STATUS
    $return = {"state" => "OK", "message" => "", "version" => $VERSION,
               "git_url" => $GIT_URL, "git_commit_hash" => $GIT_COMMIT_HASH};
    #END_STATUS
    return($return);
}

=head1 TYPES



=head2 trophicInteractionInput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace has a value which is a string
model_ref has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace has a value which is a string
model_ref has a value which is a string


=end text

=back



=head2 trophicInteractionOutput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string


=end text

=back



=head2 metaGenomeModelingInput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
workspace has a value which is a string
genome_ref has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
workspace has a value which is a string
genome_ref has a value which is a string


=end text

=back



=head2 metaGenomeModelingOutput

=over 4



=item Definition

=begin html

<pre>
a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string

</pre>

=end html

=begin text

a reference to a hash where the following keys are defined:
report_name has a value which is a string
report_ref has a value which is a string


=end text

=back



=cut

1;
