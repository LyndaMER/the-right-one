class AuditionsController < ApplicationController

  def index
    @auditions = policy_scope(Audition)
    @matches = {}

    @auditions.each do |audition|
      matcher = ArtistsMatcherService.new(audition)
      @matches[audition.id] = matcher.call
    end
    @matches.each { |_, matches| matches.sort_by! { |match| match[:matching_percentage] }.reverse! }
  end

  def show
    @audition = Audition.find(params[:id])
    @auditions = Audition.all
    authorize @audition
  end

  def new
    @audition = Audition.new
    if params[:required_tag_number]
      params[:required_tag_number].to_i.times { @audition.audition_tags.build }
    else
      @audition.audition_tags.build
    end
    authorize @audition
  end

  def create
    @audition = Audition.new(audition_params)
    authorize @audition
    @audition.user = current_user

    if @audition.save!
      params[:required_tags][:name].each_with_index do |tag_name, index|
        value = params[:required_tags][:value][index.to_i]
        puts "value: #{value}"
        puts "tag_name: #{tag_name}"
        next if value.empty?
        tag = Tag.find_or_create_by(name: tag_name, value: value)
        AuditionTag.create(audition: @audition, tag: tag, required: true)
      end

      params[:optional_tags][:name].each_with_index do |tag_name, index|
        value = params[:optional_tags][:value][index.to_i]
        next if value.empty?
        tag = Tag.find_or_create_by(name: tag_name, value: value)
        AuditionTag.create(audition: @audition, tag: tag, required: false)
      end
      redirect_to audition_artists_path(@audition), notice: 'Audition was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @audition = Audition.find(params[:id])
    authorize @audition
    @audition.destroy
    redirect_to auditions_path, notice: 'Audition was successfully deleted.'
  end

  private

  def audition_params
    params.require(:audition).permit(:name, :description, :date)
  end
end
