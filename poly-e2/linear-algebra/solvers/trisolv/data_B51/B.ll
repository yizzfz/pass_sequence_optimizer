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
  br label %for.body

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.lr.ph
  %indvar = phi i64 [ %indvar.next, %for.end.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv6 = phi i32 [ %indvars.iv.next7, %for.end.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %idxprom = sext i32 %indvars.iv6 to i64
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom
  store double -9.990000e+02, double* %arrayidx, align 8
  %conv = sitofp i32 %indvars.iv6 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %idxprom
  store double %conv, double* %arrayidx2, align 8
  %cmp41 = icmp sgt i32 %indvars.iv6, -1
  %indvars.iv.next7 = add i32 %indvars.iv6, 1
  br i1 %cmp41, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.body
  %sub = add i32 %indvars.iv6, 2001
  %0 = and i64 %indvar, 1
  %lcmp.mod = icmp eq i64 %0, 0
  br i1 %lcmp.mod, label %for.body6.prol, label %for.body6.prol.loopexit

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %conv8.prol = sitofp i32 %sub to double
  %mul.prol = fmul double %conv8.prol, 2.000000e+00
  %div.prol = fdiv double %mul.prol, 2.000000e+03
  %arrayidx13.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %idxprom, i64 0
  store double %div.prol, double* %arrayidx13.prol, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.lr.ph, %for.body6.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %1 = icmp eq i64 %indvar, 0
  br i1 %1, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv6 to i64
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.for.body6_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %sub, %2
  %conv8 = sitofp i32 %add7 to double
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %idxprom, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %sub, %3
  %conv8.1 = sitofp i32 %add7.1 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv8.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %div = fdiv <2 x double> %mul, <double 2.000000e+03, double 2.000000e+03>
  %4 = bitcast double* %arrayidx13 to <2 x double>*
  store <2 x double> %div, <2 x double>* %4, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.body
  %cmp = icmp slt i32 %indvars.iv.next7, 2000
  br i1 %cmp, label %for.end.for.body_crit_edge, label %for.end16

for.end.for.body_crit_edge:                       ; preds = %for.end
  %indvar.next = add i64 %indvar, 1
  br label %for.body

for.end16:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv([2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
for.body.preheader:
  %sunkaddr.prol = ptrtoint double* %x to i64
  br label %for.body

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %indvars.iv6 = phi i32 [ %indvars.iv.next7, %for.end.for.body_crit_edge ], [ -1, %for.body.preheader ]
  %0 = add i64 %indvars.iv8, 4294967295
  %1 = and i64 %0, 4294967295
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv8
  %2 = load double, double* %arrayidx, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv8
  store double %2, double* %arrayidx2, align 8
  %cmp41 = icmp sgt i64 %indvars.iv8, 0
  br i1 %cmp41, label %for.body5.preheader, label %for.end

for.body5.preheader:                              ; preds = %for.body
  %3 = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %3, 0
  br i1 %lcmp.mod, label %for.body5.prol, label %for.body5.prol.loopexit

for.body5.prol:                                   ; preds = %for.body5.preheader
  %arrayidx9.prol = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv8, i64 0
  %4 = load double, double* %arrayidx9.prol, align 8
  %5 = load double, double* %x, align 8
  %mul.prol = fmul double %4, %5
  %sub.prol = fsub double %2, %mul.prol
  %sunkaddr10.prol = shl i64 %indvars.iv8, 3
  %sunkaddr11.prol = add i64 %sunkaddr.prol, %sunkaddr10.prol
  %sunkaddr12.prol = inttoptr i64 %sunkaddr11.prol to double*
  store double %sub.prol, double* %sunkaddr12.prol, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body5.prol ], [ 0, %for.body5.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ %2, %for.body5.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body5.prol ], [ undef, %for.body5.preheader ]
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %for.end, label %for.body5.preheader17

for.body5.preheader17:                            ; preds = %for.body5.prol.loopexit
  %sunkaddr10 = shl i64 %indvars.iv8, 3
  %sunkaddr11 = add i64 %sunkaddr.prol, %sunkaddr10
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  %wide.trip.count.1 = zext i32 %indvars.iv6 to i64
  br label %for.body5

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.preheader17
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body5.for.body5_crit_edge ], [ %indvars.iv.unr.ph, %for.body5.preheader17 ]
  %7 = phi double [ %sub.1, %for.body5.for.body5_crit_edge ], [ %.unr.ph, %for.body5.preheader17 ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %9 = load double, double* %arrayidx11, align 8
  %mul = fmul double %8, %9
  %sub = fsub double %7, %mul
  store double %sub, double* %sunkaddr12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.1 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv8, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx9.1, align 8
  %arrayidx11.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx11.1, align 8
  %mul.1 = fmul double %10, %11
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %sunkaddr12, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br label %for.body5

for.end.loopexit:                                 ; preds = %for.body5
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body5.prol.loopexit, %for.body
  %12 = phi double [ %2, %for.body ], [ %sub.lcssa.unr.ph, %for.body5.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv8, i64 %indvars.iv8
  %13 = load double, double* %arrayidx19, align 8
  %div = fdiv double %12, %13
  %sunkaddr14 = shl i64 %indvars.iv8, 3
  %sunkaddr15 = add i64 %sunkaddr.prol, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  store double %div, double* %sunkaddr16, align 8
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.end.for.body_crit_edge, label %for.end24

for.end.for.body_crit_edge:                       ; preds = %for.end
  %indvars.iv.next7 = add nsw i32 %indvars.iv6, 1
  br label %for.body

for.end24:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* %x) unnamed_addr #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %4 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %4) #5
  %5 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %5, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #4
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
