; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay3 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_trisolv([2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.end, %for.body.lr.ph
  %indvars.iv6 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next7, %for.end ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double -9.990000e+02, double* %arrayidx, align 8
  %0 = trunc i64 %indvars.iv6 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv6
  store double %conv, double* %arrayidx2, align 8
  %1 = add nuw nsw i64 %indvars.iv6, 2001
  %2 = trunc i64 %1 to i32
  %3 = and i64 %indvars.iv6, 1
  %lcmp.mod = icmp eq i64 %3, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %conv8.prol = sitofp i32 %2 to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, 2.000000e+03
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %indvars.iv6, 0
  br i1 %4, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %5 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %2, %5
  %conv8 = sitofp i32 %add7 to double
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %2, %6
  %conv8.1 = sitofp i32 %add7.1 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv8.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %div = fdiv <2 x double> %mul, <double 2.000000e+03, double 2.000000e+03>
  %7 = bitcast double* %arrayidx13 to <2 x double>*
  store <2 x double> %div, <2 x double>* %7, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv6
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.unr-lcssa, label %for.body6

for.end.unr-lcssa:                                ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.body6.prol.loopexit, %for.end.unr-lcssa
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp ne i64 %indvars.iv.next7, 2000
  br i1 %exitcond, label %for.body6.lr.ph, label %for.end16

for.end16:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
for.body.preheader:
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.end ], [ 0, %for.body.preheader ]
  %indvars.iv4 = phi i32 [ %indvars.iv.next5, %for.end ], [ -1, %for.body.preheader ]
  %0 = add nuw nsw i64 %indvars.iv6, 4294967295
  %1 = and i64 %0, 4294967295
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv6
  %2 = bitcast double* %arrayidx to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  %4 = bitcast double* %arrayidx2 to i64*
  store i64 %3, i64* %4, align 8
  %5 = bitcast i64 %3 to double
  %cmp42 = icmp sgt i64 %indvars.iv6, 0
  br i1 %cmp42, label %for.body5.preheader, label %for.end

for.body5.preheader:                              ; preds = %for.body
  %wide.trip.count = zext i32 %indvars.iv4 to i64
  %6 = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %for.body5.prol.preheader, label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.preheader:                         ; preds = %for.body5.preheader
  br label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.prol.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 0
  %7 = load double, double* %arrayidx9.prol, align 8
  %8 = load double, double* %x, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %5, %mul.prol
  store double %sub.prol, double* %arrayidx2, align 8
  br label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.loopexit.unr-lcssa:                ; preds = %for.body5.preheader, %for.body5.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ undef, %for.body5.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ %5, %for.body5.preheader ]
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol.loopexit.unr-lcssa
  %9 = icmp eq i64 %1, 0
  br i1 %9, label %for.end.loopexit, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.preheader.new ], [ %indvars.iv.next.1, %for.body5 ]
  %10 = phi double [ %.unr.ph, %for.body5.preheader.new ], [ %sub.1, %for.body5 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 %indvars.iv
  %11 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %12 = load double, double* %arrayidx11, align 8
  %mul = fmul double %11, %12
  %sub = fsub double %10, %mul
  store double %sub, double* %arrayidx2, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %13, %14
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx2, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body5

for.end.loopexit.unr-lcssa:                       ; preds = %for.body5
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body5.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body5.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %.lcssa = phi double [ %5, %for.body ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv6, i64 %indvars.iv6
  %15 = load double, double* %arrayidx19, align 8
  %div = fdiv double %.lcssa, %15
  store double %div, double* %arrayidx2, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %indvars.iv.next5 = add nsw i32 %indvars.iv4, 1
  %exitcond = icmp ne i64 %indvars.iv.next7, 2000
  br i1 %exitcond, label %for.body, label %for.end24

for.end24:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* %x) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = phi %struct._IO_FILE* [ %3, %for.body.preheader ], [ %8, %if.end ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %5) #5
  %6 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %6, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
