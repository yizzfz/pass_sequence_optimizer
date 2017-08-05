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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay3 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #2 {
entry:
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %add = add i32 %n, 1
  %conv9 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  br label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.inc14, %for.body.lr.ph
  %indvars.iv16 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next17, %for.inc14 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv16
  store double -9.990000e+02, double* %arrayidx, align 8
  %1 = trunc i64 %indvars.iv16 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv16
  store double %conv, double* %arrayidx2, align 8
  %2 = trunc i64 %indvars.iv16 to i32
  %sub = add i32 %add, %2
  %3 = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %3, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %conv8.prol = sitofp i32 %sub to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, %conv9
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %indvars.iv16, 0
  br i1 %4, label %for.inc14, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %5 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %sub, %5
  %conv8 = sitofp i32 %add7 to double
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %sub, %6
  %conv8.1 = sitofp i32 %add7.1 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv8.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv9, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv9, i32 1
  %div = fdiv <2 x double> %mul, %div.v.i1.2
  %7 = bitcast double* %arrayidx13 to <2 x double>*
  store <2 x double> %div, <2 x double>* %7, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv16
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc14.unr-lcssa, label %for.body6

for.inc14.unr-lcssa:                              ; preds = %for.body6
  br label %for.inc14

for.inc14:                                        ; preds = %for.body6.prol.loopexit, %for.inc14.unr-lcssa
  %indvars.iv.next17 = add nuw i64 %indvars.iv16, 1
  %cmp = icmp slt i64 %indvars.iv.next17, %0
  br i1 %cmp, label %for.body6.lr.ph, label %for.end16.loopexit

for.end16.loopexit:                               ; preds = %for.inc14
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #2 {
entry:
  %cmp14 = icmp sgt i32 %n, 0
  br i1 %cmp14, label %for.body.preheader, label %for.end24

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.end ], [ 0, %for.body.preheader ]
  %indvars.iv17 = phi i32 [ %indvars.iv.next18, %for.end ], [ -1, %for.body.preheader ]
  %1 = add i64 %indvars.iv19, 4294967295
  %2 = and i64 %1, 4294967295
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv19
  %3 = bitcast double* %arrayidx to i64*
  %4 = load i64, i64* %3, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv19
  %5 = bitcast double* %arrayidx2 to i64*
  store i64 %4, i64* %5, align 8
  %cmp412 = icmp sgt i64 %indvars.iv19, 0
  br i1 %cmp412, label %for.body5.preheader, label %for.end

for.body5.preheader:                              ; preds = %for.body
  %wide.trip.count = zext i32 %indvars.iv17 to i64
  %6 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %for.body5.prol.preheader, label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.preheader:                         ; preds = %for.body5.preheader
  br label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.prol.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv19, i64 0
  %7 = load double, double* %arrayidx9.prol, align 8
  %8 = load double, double* %x, align 8
  %mul.prol = fmul double %7, %8
  %9 = load double, double* %arrayidx2, align 8
  %sub.prol = fsub double %9, %mul.prol
  store double %sub.prol, double* %arrayidx2, align 8
  br label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.loopexit.unr-lcssa:                ; preds = %for.body5.preheader, %for.body5.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.preheader ]
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %2, 0
  br i1 %10, label %for.end.loopexit, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.preheader.new ], [ %indvars.iv.next.1, %for.body5 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv19, i64 %indvars.iv
  %11 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %12 = load double, double* %arrayidx11, align 8
  %mul = fmul double %11, %12
  %13 = load double, double* %arrayidx2, align 8
  %sub = fsub double %13, %mul
  store double %sub, double* %arrayidx2, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv19, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %14, %15
  %16 = load double, double* %arrayidx2, align 8
  %sub.1 = fsub double %16, %mul.1
  store double %sub.1, double* %arrayidx2, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body5

for.end.loopexit.unr-lcssa:                       ; preds = %for.body5
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body5.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %17 = load double, double* %arrayidx2, align 8
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv19, i64 %indvars.iv19
  %18 = load double, double* %arrayidx19, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx2, align 8
  %indvars.iv.next20 = add nuw i64 %indvars.iv19, 1
  %cmp = icmp slt i64 %indvars.iv.next20, %0
  %indvars.iv.next18 = add nsw i32 %indvars.iv17, 1
  br i1 %cmp, label %for.body, label %for.end24.loopexit

for.end24.loopexit:                               ; preds = %for.end
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp2 = icmp sgt i32 %n, 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp2, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %4 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = phi %struct._IO_FILE* [ %3, %for.body.preheader ], [ %9, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %6) #6
  %7 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %7, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %.lcssa = phi %struct._IO_FILE* [ %3, %entry ], [ %9, %for.end.loopexit ]
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
