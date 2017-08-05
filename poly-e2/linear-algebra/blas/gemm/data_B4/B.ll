; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemm(double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
for.body3.lr.ph.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.inc7.us, %for.body3.lr.ph.us.preheader
  %indvars.iv70 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next71, %for.inc7.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv64 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next65, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv64, %indvars.iv70
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv64
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next65, 1100
  br i1 %exitcond69, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 1000
  br i1 %exitcond73, label %for.body17.lr.ph.us.new.preheader, label %for.body3.lr.ph.us

for.body17.lr.ph.us.new.preheader:                ; preds = %for.inc7.us
  br label %for.body17.lr.ph.us.new

for.body17.lr.ph.us.new:                          ; preds = %for.body17.lr.ph.us.new.preheader, %for.inc31.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc31.us ], [ 0, %for.body17.lr.ph.us.new.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.body17.lr.ph.us.new
  %indvars.iv54 = phi i64 [ 0, %for.body17.lr.ph.us.new ], [ %indvars.iv.next55.1, %for.body17.us ]
  %indvars.iv.next55 = or i64 %indvars.iv54, 1
  %3 = mul nuw nsw i64 %indvars.iv.next55, %indvars.iv59
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 1200
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.200000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv54
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %5 = mul nuw nsw i64 %indvars.iv.next55.1, %indvars.iv59
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 1200
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, 1.200000e+03
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv.next55
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, 1200
  br i1 %exitcond58.1, label %for.inc31.us, label %for.body17.us

for.inc31.us:                                     ; preds = %for.body17.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond62, label %for.body41.lr.ph.us.preheader, label %for.body17.lr.ph.us.new

for.body41.lr.ph.us.preheader:                    ; preds = %for.inc31.us
  br label %for.body41.lr.ph.us

for.body41.lr.ph.us:                              ; preds = %for.body41.lr.ph.us.preheader, %for.inc55.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc55.us ], [ 0, %for.body41.lr.ph.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.body41.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body41.lr.ph.us ], [ %indvars.iv.next, %for.body41.us ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %7, %indvars.iv49
  %9 = trunc i64 %8 to i32
  %rem44.us = srem i32 %9, 1100
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, 1.100000e+03
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc55.us, label %for.body41.us

for.inc55.us:                                     ; preds = %for.body41.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond52, label %for.end57, label %for.body41.lr.ph.us

for.end57:                                        ; preds = %for.inc55.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
for.body3.lr.ph.us.preheader:
  br label %for.body3.lr.ph.us.new

for.body3.lr.ph.us.new:                           ; preds = %for.inc32.us, %for.body3.lr.ph.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next56, %for.inc32.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us.new
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph.us.new ], [ %indvars.iv.next.3, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond.3, label %for.body11.lr.ph.us.us.new.preheader, label %for.body3.us

for.body11.lr.ph.us.us.new.preheader:             ; preds = %for.body3.us
  br label %for.body11.lr.ph.us.us.new

for.inc32.us:                                     ; preds = %for.inc29.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %for.end34, label %for.body3.lr.ph.us.new

for.body11.lr.ph.us.us.new:                       ; preds = %for.body11.lr.ph.us.us.new.preheader, %for.inc29.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc29.us.us ], [ 0, %for.body11.lr.ph.us.us.new.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv52
  br label %for.body11.us.us

for.inc29.us.us:                                  ; preds = %for.body11.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond, label %for.inc32.us, label %for.body11.lr.ph.us.us.new

for.body11.us.us:                                 ; preds = %for.body11.us.us, %for.body11.lr.ph.us.us.new
  %indvars.iv46 = phi i64 [ 0, %for.body11.lr.ph.us.us.new ], [ %indvars.iv.next47.1, %for.body11.us.us ]
  %4 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %4, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv46
  %5 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %5
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv46
  %6 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %6, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %7 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %7, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv.next47
  %8 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %8
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next47
  %9 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %9, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, 1100
  br i1 %exitcond.1, label %for.inc29.us.us, label %for.body11.us.us

for.end34:                                        ; preds = %for.inc32.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* %C) unnamed_addr #0 {
for.body4.lr.ph.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us, %for.body4.lr.ph.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next15, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond18, label %for.end12, label %for.body4.lr.ph.us

for.end12:                                        ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
