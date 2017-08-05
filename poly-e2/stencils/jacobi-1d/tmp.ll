; ModuleID = 'B.ll'
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(double* %arraydecay, double* %arraydecay2)
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
  tail call fastcc void @print_array(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep = getelementptr double, double* %A, i64 2000
  %scevgep4 = getelementptr double, double* %B, i64 2000
  %bound0 = icmp ugt double* %scevgep4, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %entry
  br label %vector.body

for.body.preheader:                               ; preds = %entry
  br label %for.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %vec.ind6 = phi <2 x i32> [ %vec.ind.next7, %vector.body ], [ <i32 0, i32 1>, %vector.body.preheader ]
  %0 = sitofp <2 x i32> %vec.ind6 to <2 x double>
  %1 = fadd <2 x double> %0, <double 2.000000e+00, double 2.000000e+00>
  %2 = fdiv <2 x double> %1, <double 2.000000e+03, double 2.000000e+03>
  %3 = getelementptr inbounds double, double* %A, i64 %index
  %4 = bitcast double* %3 to <2 x double>*
  store <2 x double> %2, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %5 = fadd <2 x double> %0, <double 3.000000e+00, double 3.000000e+00>
  %6 = fdiv <2 x double> %5, <double 2.000000e+03, double 2.000000e+03>
  %7 = getelementptr inbounds double, double* %B, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8, !alias.scope !4
  %index.next = add nuw nsw i64 %index, 2
  %vec.ind.next7 = add <2 x i32> %vec.ind6, <i32 2, i32 2>
  %9 = icmp eq i64 %index.next, 2000
  br i1 %9, label %for.end.loopexit8, label %vector.body, !llvm.loop !6

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.preheader ]
  %10 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %10 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, 2.000000e+03
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, 2.000000e+03
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end.loopexit8:                                ; preds = %vector.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit8, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep2 = getelementptr double, double* %A, i64 1999
  %scevgep5 = getelementptr double, double* %B, i64 2000
  %scevgep18 = getelementptr double, double* %B, i64 1
  %scevgep20 = getelementptr double, double* %B, i64 1999
  %scevgep24 = getelementptr double, double* %A, i64 2000
  %bound026 = icmp ult double* %scevgep18, %scevgep24
  %bound127 = icmp ugt double* %scevgep20, %A
  %memcheck.conflict29 = and i1 %bound026, %bound127
  %bound0 = icmp ult double* %scevgep, %scevgep5
  %bound1 = icmp ugt double* %scevgep2, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc33, %entry
  %t.022 = phi i32 [ 0, %entry ], [ %inc34, %for.inc33 ]
  br i1 %memcheck.conflict29, label %for.body3.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond1.preheader
  br label %vector.body13

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index32 = phi i64 [ %index.next33, %vector.body13 ], [ 0, %vector.body13.preheader ]
  %offset.idx36 = or i64 %index32, 1
  %0 = add nsw i64 %offset.idx36, -1
  %1 = getelementptr inbounds double, double* %A, i64 %0
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !10
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !10
  %5 = getelementptr inbounds double, double* %A, i64 %offset.idx36
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !10
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !10
  %9 = fadd <2 x double> %wide.load41, %wide.load43
  %10 = fadd <2 x double> %wide.load42, %wide.load44
  %11 = add nuw nsw i64 %offset.idx36, 1
  %12 = getelementptr inbounds double, double* %A, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !10
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !10
  %16 = fadd <2 x double> %9, %wide.load45
  %17 = fadd <2 x double> %10, %wide.load46
  %18 = fmul <2 x double> %16, <double 3.333300e-01, double 3.333300e-01>
  %19 = fmul <2 x double> %17, <double 3.333300e-01, double 3.333300e-01>
  %20 = getelementptr inbounds double, double* %B, i64 %offset.idx36
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %18, <2 x double>* %21, align 8, !alias.scope !13, !noalias !10
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> %19, <2 x double>* %23, align 8, !alias.scope !13, !noalias !10
  %index.next33 = add nuw nsw i64 %index32, 4
  %24 = icmp eq i64 %index.next33, 1996
  br i1 %24, label %for.body3.preheader.loopexit, label %vector.body13, !llvm.loop !15

for.body3.preheader.loopexit:                     ; preds = %vector.body13
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.preheader.loopexit, %for.cond1.preheader
  %indvars.iv.ph = phi i64 [ 1, %for.cond1.preheader ], [ 1997, %for.body3.preheader.loopexit ]
  br i1 false, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.prol, %for.body3.preheader
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br i1 false, label %vector.memcheck, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3 ]
  %25 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %25
  %26 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %27 = load double, double* %arrayidx6, align 8
  %add = fadd double %26, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %28 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %28
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %29 = load double, double* %arrayidx.1, align 8
  %arrayidx6.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx6.1, align 8
  %add.1 = fadd double %29, %30
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %31 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %31
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1998
  br i1 %exitcond.1, label %vector.memcheck.unr-lcssa, label %for.body3, !llvm.loop !16

vector.memcheck.unr-lcssa:                        ; preds = %for.body3
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.unr-lcssa, %for.body3.prol.loopexit
  br i1 %memcheck.conflict, label %for.body16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %32 = add nsw i64 %offset.idx, -1
  %33 = getelementptr inbounds double, double* %B, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !17
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load8 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !17
  %37 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load9 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !17
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !17
  %41 = fadd <2 x double> %wide.load, %wide.load9
  %42 = fadd <2 x double> %wide.load8, %wide.load10
  %43 = add nuw nsw i64 %offset.idx, 1
  %44 = getelementptr inbounds double, double* %B, i64 %43
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !17
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !17
  %48 = fadd <2 x double> %41, %wide.load11
  %49 = fadd <2 x double> %42, %wide.load12
  %50 = fmul <2 x double> %48, <double 3.333300e-01, double 3.333300e-01>
  %51 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %52 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> %50, <2 x double>* %53, align 8, !alias.scope !20, !noalias !17
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> %51, <2 x double>* %55, align 8, !alias.scope !20, !noalias !17
  %index.next = add nuw nsw i64 %index, 4
  %56 = icmp eq i64 %index.next, 1996
  br i1 %56, label %for.body16.preheader.loopexit, label %vector.body, !llvm.loop !22

for.body16.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.preheader.loopexit, %vector.memcheck
  %indvars.iv24.ph = phi i64 [ 1, %vector.memcheck ], [ 1997, %for.body16.preheader.loopexit ]
  br i1 false, label %for.body16.prol.preheader, label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  br label %for.body16.prol

for.body16.prol:                                  ; preds = %for.body16.prol.preheader
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.prol, %for.body16.preheader
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.prol.loopexit.unr-lcssa
  br i1 false, label %for.inc33, label %for.body16.preheader.new

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit
  br label %for.body16

for.body16:                                       ; preds = %for.body16, %for.body16.preheader.new
  %indvars.iv24 = phi i64 [ %indvars.iv24.ph, %for.body16.preheader.new ], [ %indvars.iv.next25.1, %for.body16 ]
  %57 = add nsw i64 %indvars.iv24, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %57
  %58 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv24
  %59 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %58, %59
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next25
  %60 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %60
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv24
  store double %mul27, double* %arrayidx29, align 8
  %arrayidx19.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv24
  %61 = load double, double* %arrayidx19.1, align 8
  %arrayidx21.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next25
  %62 = load double, double* %arrayidx21.1, align 8
  %add22.1 = fadd double %61, %62
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next25.1
  %63 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %63
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next25
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25, 1998
  br i1 %exitcond27.1, label %for.inc33.unr-lcssa, label %for.body16, !llvm.loop !23

for.inc33.unr-lcssa:                              ; preds = %for.body16
  br label %for.inc33

for.inc33:                                        ; preds = %for.inc33.unr-lcssa, %for.body16.prol.loopexit
  %inc34 = add nuw nsw i32 %t.022, 1
  %exitcond47 = icmp eq i32 %inc34, 500
  br i1 %exitcond47, label %for.end35, label %for.cond1.preheader

for.end35:                                        ; preds = %for.inc33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
