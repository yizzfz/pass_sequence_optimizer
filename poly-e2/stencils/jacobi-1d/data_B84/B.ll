; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = sext i32 %n to i64
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.preheader ], [ 1, %for.inc.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %6 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, %div.v.i1.2
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %1
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.body.preheader, label %for.end35

for.body.preheader:                               ; preds = %entry
  %sub1 = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub1, 1
  %0 = sext i32 %sub1 to i64
  %1 = add nsw i64 %0, -1
  %2 = add nsw i64 %0, -2
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i64 %2, 0
  %arrayidx21.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.prol = getelementptr inbounds double, double* %A, i64 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 2
  br label %for.body

for.body:                                         ; preds = %for.inc33, %for.body.preheader
  %inc3411 = phi i32 [ 0, %for.body.preheader ], [ %inc34, %for.inc33 ]
  br i1 %cmp22, label %for.inc.preheader, label %for.inc33

for.inc.preheader:                                ; preds = %for.body
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  %4 = load double, double* %A, align 8
  %5 = load double, double* %arrayidx29.prol, align 8
  %add.prol = fadd double %4, %5
  %6 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %6
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  store double %mul.prol, double* %arrayidx21.prol, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 2, %for.inc.prol.preheader ], [ 1, %for.inc.preheader ]
  br i1 %3, label %for.end, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %add7.1, %for.inc ]
  %sub4 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %sub4
  %7 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %8 = load double, double* %arrayidx6, align 8
  %add = fadd double %7, %8
  %add7 = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %add7
  %9 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %9
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %10 = load double, double* %arrayidx6, align 8
  %11 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %10, %11
  %add7.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %add7.1
  %12 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %12
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %add7
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %add7, %1
  br i1 %exitcond.1, label %for.end.unr-lcssa, label %for.inc

for.end.unr-lcssa:                                ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.inc.prol.loopexit.unr-lcssa, %for.end.unr-lcssa
  br i1 true, label %for.inc30.preheader, label %for.end.for.inc33_crit_edge

for.end.for.inc33_crit_edge:                      ; preds = %for.end
  br label %for.inc33

for.inc30.preheader:                              ; preds = %for.end
  br i1 %lcmp.mod, label %for.inc30.prol.loopexit.unr-lcssa, label %for.inc30.prol.preheader

for.inc30.prol.preheader:                         ; preds = %for.inc30.preheader
  %13 = load double, double* %B, align 8
  %14 = load double, double* %arrayidx21.prol, align 8
  %add22.prol = fadd double %13, %14
  %15 = load double, double* %arrayidx25.prol, align 8
  %add26.prol = fadd double %add22.prol, %15
  %mul27.prol = fmul double %add26.prol, 3.333300e-01
  store double %mul27.prol, double* %arrayidx29.prol, align 8
  br label %for.inc30.prol.loopexit.unr-lcssa

for.inc30.prol.loopexit.unr-lcssa:                ; preds = %for.inc30.preheader, %for.inc30.prol.preheader
  %indvars.iv12.unr.ph = phi i64 [ 2, %for.inc30.prol.preheader ], [ 1, %for.inc30.preheader ]
  br i1 %3, label %for.inc33.loopexit, label %for.inc30.preheader.new

for.inc30.preheader.new:                          ; preds = %for.inc30.prol.loopexit.unr-lcssa
  br label %for.inc30

for.inc30:                                        ; preds = %for.inc30, %for.inc30.preheader.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.unr.ph, %for.inc30.preheader.new ], [ %add23.1, %for.inc30 ]
  %sub17 = add nsw i64 %indvars.iv12, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %sub17
  %16 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv12
  %17 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %16, %17
  %add23 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %add23
  %18 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %18
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv12
  store double %mul27, double* %arrayidx29, align 8
  %19 = load double, double* %arrayidx21, align 8
  %20 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %19, %20
  %add23.1 = add nsw i64 %indvars.iv12, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %add23.1
  %21 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %21
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %add23
  store double %mul27.1, double* %arrayidx29.1, align 8
  %cmp15.1 = icmp slt i64 %add23.1, %0
  br i1 %cmp15.1, label %for.inc30, label %for.inc33.loopexit.unr-lcssa

for.inc33.loopexit.unr-lcssa:                     ; preds = %for.inc30
  br label %for.inc33.loopexit

for.inc33.loopexit:                               ; preds = %for.inc30.prol.loopexit.unr-lcssa, %for.inc33.loopexit.unr-lcssa
  br label %for.inc33

for.inc33:                                        ; preds = %for.end.for.inc33_crit_edge, %for.inc33.loopexit, %for.body
  %inc34 = add nsw i32 %inc3411, 1
  %cmp = icmp slt i32 %inc34, %tsteps
  br i1 %cmp, label %for.body, label %for.end35.loopexit

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
