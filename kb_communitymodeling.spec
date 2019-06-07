/*
A KBase module: kb_communityinteractions
This module predict trophic interactions.
*/

module kb_communitymodeling {
    typedef structure {
        string workspace;
        string model_ref;
    } trophicInteractionInput;

    typedef structure {
        string report_name;
        string report_ref;
    } trophicInteractionOutput;


    funcdef predict_trophic_interactions(trophicInteractionInput params)
        returns (trophicInteractionOutput output) authentication required;

    typedef structure {
        string workspace;
        string genome_ref;
        string media_id;
        int gapfill_model;
        int output_model;
    } metaGenomeModelingInput;

    typedef structure {
        string report_name;
        string report_ref;
    } metaGenomeModelingOutput;


    funcdef meta_genome_model_construction(metaGenomeModelingInput params)
        returns (metaGenomeModelingOutput output) authentication required;

};
