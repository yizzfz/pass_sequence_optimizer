; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array([1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d([1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  tail call fastcc void @print_array([1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next18, %for.inc20 ]
  %0 = trunc i64 %indvars.iv17 to i32
  %conv = sitofp i32 %0 to double
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.cond1.preheader ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4 = sitofp i32 %2 to double
  %mul = fmul double %conv, %conv4
  %add5 = fadd double %mul, 2.000000e+00
  %div = fdiv double %add5, 1.300000e+03
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  store double %div, double* %arrayidx8, align 8
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11 = sitofp i32 %4 to double
  %mul12 = fmul double %conv, %conv11
  %add13 = fadd double %mul12, 3.000000e+00
  %div15 = fdiv double %add13, 1.300000e+03
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv
  store double %div15, double* %arrayidx19, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1299
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc20, label %for.body3

for.inc20:                                        ; preds = %for.body3
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next18, 1300
  br i1 %exitcond1, label %for.end22, label %for.cond1.preheader

for.end22:                                        ; preds = %for.inc20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %entry
  %t.049 = phi i32 [ 0, %entry ], [ %inc88, %for.inc87 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc37, %for.cond1.preheader
  %indvar23 = phi i64 [ %indvar.next24, %for.inc37 ], [ 0, %for.cond1.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc37 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1
  %scevgep27 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1299
  %scevgep29 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar23, i64 1
  %1 = add nuw nsw i64 %indvar23, 2
  %scevgep31 = getelementptr [1300 x double], [1300 x double]* %A, i64 %1, i64 1299
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %2 = add nsw i64 %indvars.iv51, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %for.body7.preheader, label %vector.body18.preheader

vector.body18.preheader:                          ; preds = %for.cond4.preheader
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18.preheader, %vector.body18
  %index39 = phi i64 [ %index.next40, %vector.body18 ], [ 0, %vector.body18.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %3 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %offset.idx43
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = add nsw i64 %offset.idx43, -1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load48, %wide.load50
  %13 = fadd <2 x double> %wide.load49, %wide.load51
  %14 = add nuw nsw i64 %offset.idx43, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %12, %wide.load52
  %20 = fadd <2 x double> %13, %wide.load53
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next52, i64 %offset.idx43
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %19, %wide.load54
  %26 = fadd <2 x double> %20, %wide.load55
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %offset.idx43
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %25, %wide.load56
  %32 = fadd <2 x double> %26, %wide.load57
  %33 = fmul <2 x double> %31, <double 2.000000e-01, double 2.000000e-01>
  %34 = fmul <2 x double> %32, <double 2.000000e-01, double 2.000000e-01>
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv51, i64 %offset.idx43
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %33, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %34, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 4
  %39 = icmp eq i64 %index.next40, 1296
  br i1 %39, label %for.body7.preheader.loopexit, label %vector.body18, !llvm.loop !6

for.body7.preheader.loopexit:                     ; preds = %vector.body18
  br label %for.body7.preheader

for.body7.preheader:                              ; preds = %for.body7.preheader.loopexit, %for.cond4.preheader
  %indvars.iv.ph = phi i64 [ 1, %for.cond4.preheader ], [ 1297, %for.body7.preheader.loopexit ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ %indvars.iv.ph, %for.body7.preheader ]
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv
  %40 = load double, double* %arrayidx9, align 8
  %41 = add nsw i64 %indvars.iv, -1
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %41
  %42 = load double, double* %arrayidx14, align 8
  %add = fadd double %40, %42
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx19, align 8
  %add20 = fadd double %add, %43
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv
  %44 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add20, %44
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %indvars.iv
  %45 = load double, double* %arrayidx31, align 8
  %add32 = fadd double %add26, %45
  %mul = fmul double %add32, 2.000000e-01
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv
  store double %mul, double* %arrayidx36, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1298
  br i1 %exitcond, label %for.inc37, label %for.body7, !llvm.loop !9

for.inc37:                                        ; preds = %for.body7
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond58 = icmp eq i64 %indvar.next24, 1298
  br i1 %exitcond58, label %for.cond44.preheader.preheader, label %for.cond4.preheader

for.cond44.preheader.preheader:                   ; preds = %for.inc37
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.preheader, %for.inc84
  %indvar = phi i64 [ %indvar.next, %for.inc84 ], [ 0, %for.cond44.preheader.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc84 ], [ 1, %for.cond44.preheader.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %46, i64 1
  %scevgep2 = getelementptr [1300 x double], [1300 x double]* %A, i64 %46, i64 1299
  %scevgep4 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %47 = add nuw nsw i64 %indvar, 2
  %scevgep6 = getelementptr [1300 x double], [1300 x double]* %B, i64 %47, i64 1299
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %48 = add nsw i64 %indvars.iv58, -1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond44.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %offset.idx
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load9 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = add nsw i64 %offset.idx, -1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %53
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load, %wide.load10
  %59 = fadd <2 x double> %wide.load9, %wide.load11
  %60 = add nuw nsw i64 %offset.idx, 1
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %58, %wide.load12
  %66 = fadd <2 x double> %59, %wide.load13
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next59, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fadd <2 x double> %65, %wide.load14
  %72 = fadd <2 x double> %66, %wide.load15
  %73 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %48, i64 %offset.idx
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %71, %wide.load16
  %78 = fadd <2 x double> %72, %wide.load17
  %79 = fmul <2 x double> %77, <double 2.000000e-01, double 2.000000e-01>
  %80 = fmul <2 x double> %78, <double 2.000000e-01, double 2.000000e-01>
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv58, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %79, <2 x double>* %82, align 8, !alias.scope !13, !noalias !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> %80, <2 x double>* %84, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %85 = icmp eq i64 %index.next, 1296
  br i1 %85, label %for.body47.preheader.loopexit, label %vector.body, !llvm.loop !15

for.body47.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body47.preheader

for.body47.preheader:                             ; preds = %for.body47.preheader.loopexit, %for.cond44.preheader
  %indvars.iv54.ph = phi i64 [ 1, %for.cond44.preheader ], [ 1297, %for.body47.preheader.loopexit ]
  br label %for.body47

for.body47:                                       ; preds = %for.body47.preheader, %for.body47
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.body47 ], [ %indvars.iv54.ph, %for.body47.preheader ]
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv54
  %86 = load double, double* %arrayidx51, align 8
  %87 = add nsw i64 %indvars.iv54, -1
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %87
  %88 = load double, double* %arrayidx56, align 8
  %add57 = fadd double %86, %88
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv.next55
  %89 = load double, double* %arrayidx62, align 8
  %add63 = fadd double %add57, %89
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next59, i64 %indvars.iv54
  %90 = load double, double* %arrayidx68, align 8
  %add69 = fadd double %add63, %90
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %48, i64 %indvars.iv54
  %91 = load double, double* %arrayidx74, align 8
  %add75 = fadd double %add69, %91
  %mul76 = fmul double %add75, 2.000000e-01
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv54
  store double %mul76, double* %arrayidx80, align 8
  %exitcond57 = icmp eq i64 %indvars.iv54, 1298
  br i1 %exitcond57, label %for.inc84, label %for.body47, !llvm.loop !16

for.inc84:                                        ; preds = %for.body47
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond59 = icmp eq i64 %indvar.next, 1298
  br i1 %exitcond59, label %for.inc87, label %for.cond44.preheader

for.inc87:                                        ; preds = %for.inc84
  %inc88 = add nuw nsw i32 %t.049, 1
  %exitcond60 = icmp eq i32 %inc88, 500
  br i1 %exitcond60, label %for.end89, label %for.cond1.preheader

for.end89:                                        ; preds = %for.inc87
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1300 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1300
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 1300
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
