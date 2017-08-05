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
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay32 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay1, double* %arraydecay32, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %arraydecay1, double* %arraydecay32, double* %arraydecay4)
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
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 2000, double* %1)
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
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %conv9 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %1 = sext i32 %n to i64
  br label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.end, %for.body.lr.ph
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next10, %for.end ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv9
  store double -9.990000e+02, double* %arrayidx, align 8
  %2 = trunc i64 %indvars.iv9 to i32
  %conv = sitofp i32 %2 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv9
  store double %conv, double* %arrayidx2, align 8
  %3 = add nuw nsw i64 %indvars.iv9, %0
  %4 = and i64 %indvars.iv9, 1
  %lcmp.mod = icmp eq i64 %4, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %5 = add nuw nsw i64 %3, 1
  %6 = trunc i64 %5 to i32
  %conv8.prol = sitofp i32 %6 to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, %conv9
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %7 = icmp eq i64 %indvars.iv9, 0
  br i1 %7, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %8 = sub i64 %3, %indvars.iv
  %9 = add i64 %8, 1
  %10 = trunc i64 %9 to i32
  %conv8 = sitofp i32 %10 to double
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = sub i64 %3, %indvars.iv.next
  %12 = add i64 %11, 1
  %13 = trunc i64 %12 to i32
  %conv8.1 = sitofp i32 %13 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv8.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv9, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv9, i32 1
  %div = fdiv <2 x double> %mul, %div.v.i1.2
  %14 = bitcast double* %arrayidx13 to <2 x double>*
  store <2 x double> %div, <2 x double>* %14, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv9
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.unr-lcssa, label %for.body6

for.end.unr-lcssa:                                ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.body6.prol.loopexit, %for.end.unr-lcssa
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp ne i64 %indvars.iv.next10, %1
  br i1 %exitcond, label %for.body6.lr.ph, label %for.end16.loopexit

for.end16.loopexit:                               ; preds = %for.end
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.body.lr.ph, label %for.end24

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  %sunkaddr.prol = ptrtoint double* %x to i64
  %sunkaddr = ptrtoint double* %x to i64
  %sunkaddr.1 = ptrtoint double* %x to i64
  %1 = ptrtoint double* %x to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.end ], [ 0, %for.body.lr.ph ]
  %indvars.iv14 = phi i32 [ %indvars.iv.next15, %for.end ], [ -1, %for.body.lr.ph ]
  %2 = add nuw nsw i64 %indvars.iv16, 4294967295
  %3 = and i64 %2, 4294967295
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv16
  %4 = bitcast double* %arrayidx to i64*
  %5 = load i64, i64* %4, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv16
  %6 = bitcast double* %arrayidx2 to i64*
  store i64 %5, i64* %6, align 8
  %7 = bitcast i64 %5 to double
  %cmp49 = icmp sgt i64 %indvars.iv16, 0
  br i1 %cmp49, label %for.body5.lr.ph, label %for.end

for.body5.lr.ph:                                  ; preds = %for.body
  %wide.trip.count = zext i32 %indvars.iv14 to i64
  %8 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.body5.prol.preheader, label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.preheader:                         ; preds = %for.body5.lr.ph
  br label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.prol.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 0
  %9 = load double, double* %arrayidx9.prol, align 8
  %10 = load double, double* %x, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %7, %mul.prol
  %sunkaddr25.prol = shl i64 %indvars.iv16, 3
  %sunkaddr26.prol = add i64 %sunkaddr.prol, %sunkaddr25.prol
  %sunkaddr27.prol = inttoptr i64 %sunkaddr26.prol to double*
  store double %sub.prol, double* %sunkaddr27.prol, align 8
  br label %for.body5.prol.loopexit.unr-lcssa

for.body5.prol.loopexit.unr-lcssa:                ; preds = %for.body5.lr.ph, %for.body5.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ undef, %for.body5.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ %7, %for.body5.lr.ph ]
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %3, 0
  br i1 %11, label %for.end.loopexit, label %for.body5.lr.ph.new

for.body5.lr.ph.new:                              ; preds = %for.body5.prol.loopexit
  %sunkaddr25 = shl i64 %indvars.iv16, 3
  %sunkaddr26 = add i64 %sunkaddr, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  %sunkaddr25.1 = shl i64 %indvars.iv16, 3
  %sunkaddr26.1 = add i64 %sunkaddr.1, %sunkaddr25.1
  %sunkaddr27.1 = inttoptr i64 %sunkaddr26.1 to double*
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.lr.ph.new ], [ %indvars.iv.next.1, %for.body5 ]
  %12 = phi double [ %.unr.ph, %for.body5.lr.ph.new ], [ %sub.1, %for.body5 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 %indvars.iv
  %13 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %14 = load double, double* %arrayidx11, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %sunkaddr27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %sunkaddr27.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body5

for.end.loopexit.unr-lcssa:                       ; preds = %for.body5
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body5.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body5.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %.lcssa = phi double [ %7, %for.body ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv16, i64 %indvars.iv16
  %17 = load double, double* %arrayidx19, align 8
  %div = fdiv double %.lcssa, %17
  %sunkaddr22 = shl i64 %indvars.iv16, 3
  %sunkaddr23 = add i64 %1, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  store double %div, double* %sunkaddr24, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %indvars.iv.next15 = add nsw i32 %indvars.iv14, 1
  %exitcond = icmp ne i64 %indvars.iv.next17, %0
  br i1 %exitcond, label %for.body, label %for.end24.loopexit

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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %5) #6
  %6 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %6, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
