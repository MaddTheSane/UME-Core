/*
 Copyright (c) 2013, 2016 OpenEmu Team
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
     * Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
     * Neither the name of the OpenEmu Team nor the
       names of its contributors may be used to endorse or promote products
       derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY OpenEmu Team ''AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL OpenEmu Team BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "MAMEGameCore.h"

#include "osx_osd_interface.h"

osx_osd_interface::osx_osd_interface(MAMEGameCore *core, osd_options &options)
:osd_common_t(options), m_core(core)
{
}

void osx_osd_interface::init(running_machine &machine)
{
    osd_common_t::init(machine);
    osd_common_t::init_subsystems();
    [m_core osd_init:&machine];
    
}

void osx_osd_interface::update(bool skip_redraw)
{
    [m_core osd_update:skip_redraw];
}

void osx_osd_interface::update_audio_stream(const INT16 *buffer, int samples_this_frame)
{
    [m_core osd_update_audio_stream:buffer samples:samples_this_frame];
}

void osx_osd_interface::osd_exit()
{
    [m_core osd_exit:&machine()];
}


