class RaylibActions {
    has Str @.bindings;
    method TOP ($/) {

    }

    method function($/) {
        @.bindings.push($<type> ~ ' ' ~ $<identifier> ~ '(' ~ $<parameters> ~ ')');
    }

}
