; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2100, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv48 = phi i64 [ 0, %entry ], [ %indvars.iv.next5.2, %for.body ]
  %0 = trunc i64 %indvars.iv48 to i32
  %conv2 = sitofp i32 %0 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv48
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv48, 1
  %1 = trunc i64 %indvars.iv.next5 to i32
  %conv2.1 = sitofp i32 %1 to double
  %div.1 = fdiv double %conv2.1, 2.100000e+03
  %add.1 = fadd double %div.1, 1.000000e+00
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next5
  store double %add.1, double* %arrayidx.1, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv48, 2
  %2 = trunc i64 %indvars.iv.next5.1 to i32
  %conv2.2 = sitofp i32 %2 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next5.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv48, 3
  %exitcond10.2 = icmp eq i64 %indvars.iv.next5.2, 2100
  br i1 %exitcond10.2, label %for.cond7.preheader.preheader, label %for.body

for.cond7.preheader.preheader:                    ; preds = %for.body
  br label %for.cond7.preheader

for.cond7.preheader:                              ; preds = %for.cond7.preheader.preheader, %for.inc22
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %for.inc22 ], [ 0, %for.cond7.preheader.preheader ]
  br label %for.body10

for.body10:                                       ; preds = %for.body10, %for.cond7.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond7.preheader ], [ %indvars.iv.next.1, %for.body10 ]
  %3 = add nuw nsw i64 %indvars.iv6, %indvars.iv27
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2100
  %conv12 = sitofp i32 %rem to double
  %div14 = fdiv double %conv12, 9.500000e+03
  %arrayidx18 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv6
  store double %div14, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv6, 1
  %5 = add nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %6 = trunc i64 %5 to i32
  %rem.1 = srem i32 %6, 2100
  %conv12.1 = sitofp i32 %rem.1 to double
  %div14.1 = fdiv double %conv12.1, 9.500000e+03
  %arrayidx18.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %div14.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.inc22, label %for.body10

for.inc22:                                        ; preds = %for.body10
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 1900
  br i1 %exitcond9, label %for.end24, label %for.cond7.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #2 {
entry:
  %y15 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y15, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr.1 = ptrtoint double* %tmp to i64
  %sunkaddr19 = ptrtoint double* %tmp to i64
  %sunkaddr19.1 = ptrtoint double* %tmp to i64
  %scevgep = getelementptr double, double* %y, i64 2100
  %scevgep23 = bitcast double* %scevgep to i8*
  br label %for.body5

for.body5:                                        ; preds = %for.inc42, %entry
  %indvars.iv39 = phi i64 [ %indvars.iv.next4, %for.inc42 ], [ 0, %entry ]
  %scevgep24 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 0
  %0 = add i64 %indvars.iv39, 1
  %scevgep26 = getelementptr [2100 x double], [2100 x double]* %A, i64 %0, i64 0
  %arrayidx7 = getelementptr inbounds double, double* %tmp, i64 %indvars.iv39
  store double 0.000000e+00, double* %arrayidx7, align 8
  %sunkaddr16 = shl i64 %indvars.iv39, 3
  %sunkaddr17 = add i64 %sunkaddr, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  %sunkaddr16.1 = shl i64 %indvars.iv39, 3
  %sunkaddr17.1 = add i64 %sunkaddr.1, %sunkaddr16.1
  %sunkaddr18.1 = inttoptr i64 %sunkaddr17.1 to double*
  br label %for.body10

for.body10:                                       ; preds = %for.body10, %for.body5
  %indvars.iv7 = phi i64 [ 0, %for.body5 ], [ %indvars.iv.next.1, %for.body10 ]
  %1 = load double, double* %sunkaddr18, align 8
  %arrayidx16 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv7
  %2 = load double, double* %arrayidx16, align 8
  %arrayidx18 = getelementptr inbounds double, double* %x, i64 %indvars.iv7
  %3 = load double, double* %arrayidx18, align 8
  %mul = fmul double %2, %3
  %add = fadd double %1, %mul
  store double %add, double* %sunkaddr18, align 8
  %indvars.iv.next = or i64 %indvars.iv7, 1
  %4 = load double, double* %sunkaddr18.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %5 = load double, double* %arrayidx16.1, align 8
  %arrayidx18.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx18.1, align 8
  %mul.1 = fmul double %5, %6
  %add.1 = fadd double %4, %mul.1
  store double %add.1, double* %sunkaddr18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.body26.preheader, label %for.body10

for.body26.preheader:                             ; preds = %for.body10
  %sunkaddr20 = shl i64 %indvars.iv39, 3
  %sunkaddr21 = add i64 %sunkaddr19, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %sunkaddr20.1 = shl i64 %indvars.iv39, 3
  %sunkaddr21.1 = add i64 %sunkaddr19.1, %sunkaddr20.1
  %sunkaddr22.1 = inttoptr i64 %sunkaddr21.1 to double*
  %bound0 = icmp ugt double* %scevgep26, %y
  %bound1 = icmp ult double* %scevgep24, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bc = inttoptr i64 %sunkaddr21 to i8*
  %bc28 = inttoptr i64 %sunkaddr21 to i8*
  %bound029 = icmp ult i8* %y15, %bc28
  %bound130 = icmp ult i8* %bc, %scevgep23
  %found.conflict31 = and i1 %bound029, %bound130
  %conflict.rdx = or i1 %found.conflict, %found.conflict31
  %bc32 = inttoptr i64 %sunkaddr21.1 to i8*
  %bc33 = inttoptr i64 %sunkaddr21.1 to i8*
  %bound034 = icmp ult i8* %y15, %bc33
  %bound135 = icmp ult i8* %bc32, %scevgep23
  %found.conflict36 = and i1 %bound034, %bound135
  %conflict.rdx37 = or i1 %conflict.rdx, %found.conflict36
  br i1 %conflict.rdx37, label %for.body26.preheader42, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body26.preheader
  %7 = load double, double* %sunkaddr22, align 8, !alias.scope !1
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = load double, double* %sunkaddr22.1, align 8, !alias.scope !4
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

for.body26.preheader42:                           ; preds = %for.body26.preheader
  br label %for.body26

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %13 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec38 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec39 = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !10
  %strided.vec40 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec41 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %strided.vec40, %9
  %18 = fadd <2 x double> %strided.vec, %17
  %19 = or i64 %offset.idx, 1
  %20 = getelementptr inbounds double, double* %y, i64 %19
  %21 = fmul <2 x double> %strided.vec41, %12
  %22 = fadd <2 x double> %strided.vec38, %21
  %23 = getelementptr double, double* %20, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %18, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %24, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, 1050
  br i1 %25, label %for.inc42.loopexit43, label %vector.body, !llvm.loop !11

for.body26:                                       ; preds = %for.body26.preheader42, %for.body26
  %indvars.iv18 = phi i64 [ %indvars.iv.next2.1, %for.body26 ], [ 0, %for.body26.preheader42 ]
  %arrayidx28 = getelementptr inbounds double, double* %y, i64 %indvars.iv18
  %26 = load double, double* %arrayidx28, align 8
  %arrayidx32 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv18
  %27 = load double, double* %arrayidx32, align 8
  %28 = load double, double* %sunkaddr22, align 8
  %mul35 = fmul double %27, %28
  %add36 = fadd double %26, %mul35
  store double %add36, double* %arrayidx28, align 8
  %indvars.iv.next2 = or i64 %indvars.iv18, 1
  %arrayidx28.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next2
  %29 = load double, double* %arrayidx28.1, align 8
  %arrayidx32.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next2
  %30 = load double, double* %arrayidx32.1, align 8
  %31 = load double, double* %sunkaddr22.1, align 8
  %mul35.1 = fmul double %30, %31
  %add36.1 = fadd double %29, %mul35.1
  store double %add36.1, double* %arrayidx28.1, align 8
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv18, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next2.1, 2100
  br i1 %exitcond11.1, label %for.inc42.loopexit, label %for.body26, !llvm.loop !14

for.inc42.loopexit:                               ; preds = %for.body26
  br label %for.inc42

for.inc42.loopexit43:                             ; preds = %vector.body
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit43, %for.inc42.loopexit
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 1900
  br i1 %exitcond12, label %for.end44, label %for.body5

for.end44:                                        ; preds = %for.inc42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!9, !2, !5}
!9 = distinct !{!9, !3}
!10 = !{!9}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
