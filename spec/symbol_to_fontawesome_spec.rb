require 'spec_helper'

describe SymbolToFontawesome do
  context 'generate tag fontawesome' do
    it do
      expect(:ban.fa).to eq('<i class="fa fa-ban"></i>')
    end

    context 'multiple config' do
      it { expect(:ban.fa(:lg, :left, :fw)).to eq('<i class="fa fa-ban fa-lg fa-pull-left fa-fw"></i>') }
    end

    context 'scale' do
      it { expect(:ban.fa(:lg)).to eq('<i class="fa fa-ban fa-lg"></i>') }
      it { expect(:ban.fa(2)).to eq('<i class="fa fa-ban fa-2x"></i>') }
      it { expect(:ban.fa(3)).to eq('<i class="fa fa-ban fa-3x"></i>') }
      it { expect(:ban.fa(4)).to eq('<i class="fa fa-ban fa-4x"></i>') }
      it { expect(:ban.fa(5)).to eq('<i class="fa fa-ban fa-5x"></i>') }
    end

    context 'fixed width' do
      it { expect(:ban.fa(:fw)).to eq('<i class="fa fa-ban fa-fw"></i>') }
      it { expect(:ban.fa(:fixed_width)).to eq('<i class="fa fa-ban fa-fw"></i>') }
    end

    context 'list' do
      it { expect(:ban.fa(:li)).to eq('<i class="fa fa-ban fa-li"></i>') }
    end

    context 'bordered & pulled' do
      it { expect(:ban.fa(:border)).to eq('<i class="fa fa-ban fa-border"></i>') }
      it { expect(:ban.fa(:left)).to eq('<i class="fa fa-ban fa-pull-left"></i>') }
      it { expect(:ban.fa(:right)).to eq('<i class="fa fa-ban fa-pull-right"></i>') }
    end

    context 'animated' do
      it { expect(:ban.fa(:spin)).to eq('<i class="fa fa-ban fa-spin"></i>') }
      it { expect(:ban.fa(:pulse)).to eq('<i class="fa fa-ban fa-pulse"></i>') }
    end

    context 'rotated & flipped' do
      it { expect(:ban.fa(90)).to eq('<i class="fa fa-ban fa-rotate-90"></i>') }
      it { expect(:ban.fa(180)).to eq('<i class="fa fa-ban fa-rotate-180"></i>') }
      it { expect(:ban.fa(270)).to eq('<i class="fa fa-ban fa-rotate-270"></i>') }
      it { expect(:ban.fa(:horizontal)).to eq('<i class="fa fa-ban fa-flip-horizontal"></i>') }
      it { expect(:ban.fa(:vertical)).to eq('<i class="fa fa-ban fa-flip-vertical"></i>') }
    end

    context 'stacked' do
      it do
        expect(:stack.fa(:lg){
                 stack :square_o, 2
                 stack :twitter, 1
               }).to eq('<span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x"></i></span>')
      end

      it do
        expect(:stack.fa(:lg){
                 stack :circle, 2
                 stack :flag, 1, :inverse
               }).to eq('<span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-flag fa-stack-1x fa-inverse"></i></span>')
      end

      it do
        expect(:stack.fa(:lg){
                 stack :square, 2
                 stack :terminal, 1, :inverse
               }).to eq('<span class="fa-stack fa-lg"><i class="fa fa-square fa-stack-2x"></i><i class="fa fa-terminal fa-stack-1x fa-inverse"></i></span>')
      end

      it do
        expect(:stack.fa(:lg){
                 stack :camera, 1
                 stack :ban, 2, 'text-danger'
               }).to eq('<span class="fa-stack fa-lg"><i class="fa fa-camera fa-stack-1x"></i><i class="fa fa-ban fa-stack-2x text-danger"></i></span>')
      end
    end
  end
end
