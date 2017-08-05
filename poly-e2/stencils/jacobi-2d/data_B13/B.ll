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
  %1 = bitcast i8* %call to [1300 x double]*
  tail call fastcc void @print_array([1300 x double]* %1)
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
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.end, %entry
  %indvars.iv3 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.end ]
  %0 = trunc i64 %indvars.iv3 to i32
  %conv = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond.for.cond1_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond1_crit_edge ], [ %indvars.iv.next, %for.body3 ]
  %2 = add nuw nsw i64 %indvars.iv, 2
  %3 = trunc i64 %2 to i32
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 3
  %5 = trunc i64 %4 to i32
  %conv11 = sitofp i32 %5 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv11, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %add5 = fadd <2 x double> %mul, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add5, <double 1.300000e+03, double 1.300000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx8, align 8
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %for.end22, label %for.cond.for.cond1_crit_edge

for.end22:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d([1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.end86, %entry
  %0 = phi i32 [ 0, %entry ], [ %inc88, %for.end86 ]
  br label %for.cond1.for.cond4_crit_edge

for.cond1.for.cond4_crit_edge:                    ; preds = %for.end, %for.cond.for.cond1_crit_edge
  %indvar37 = phi i64 [ %indvar.next38, %for.end ], [ 0, %for.cond.for.cond1_crit_edge ]
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.end ], [ 1, %for.cond.for.cond1_crit_edge ]
  %1 = add i64 %indvar37, 1
  %scevgep39 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1
  %scevgep41 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1299
  %scevgep43 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar37, i64 1
  %2 = add i64 %indvar37, 2
  %scevgep45 = getelementptr [1300 x double], [1300 x double]* %A, i64 %2, i64 1299
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %3 = add nsw i64 %indvars.iv2, -1
  %bound047 = icmp ult double* %scevgep39, %scevgep45
  %bound148 = icmp ult double* %scevgep43, %scevgep41
  %memcheck.conflict50 = and i1 %bound047, %bound148
  br i1 %memcheck.conflict50, label %for.body7.preheader, label %vector.body32.preheader

vector.body32.preheader:                          ; preds = %for.cond1.for.cond4_crit_edge
  br label %vector.body32

vector.body32:                                    ; preds = %vector.body32.preheader, %vector.body32
  %index53 = phi i64 [ %index.next54, %vector.body32 ], [ 0, %vector.body32.preheader ]
  %offset.idx57 = or i64 %index53, 1
  %4 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %offset.idx57
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = add nsw i64 %offset.idx57, -1
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %8
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load62, %wide.load64
  %14 = fadd <2 x double> %wide.load63, %wide.load65
  %15 = add nuw nsw i64 %offset.idx57, 1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %13, %wide.load66
  %21 = fadd <2 x double> %14, %wide.load67
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next3, i64 %offset.idx57
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %20, %wide.load68
  %27 = fadd <2 x double> %21, %wide.load69
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %offset.idx57
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %26, %wide.load70
  %33 = fadd <2 x double> %27, %wide.load71
  %34 = fmul <2 x double> %32, <double 2.000000e-01, double 2.000000e-01>
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv2, i64 %offset.idx57
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %34, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %35, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next54 = add i64 %index53, 4
  %40 = icmp eq i64 %index.next54, 1296
  br i1 %40, label %for.body7.preheader.loopexit, label %vector.body32, !llvm.loop !6

for.body7.preheader.loopexit:                     ; preds = %vector.body32
  br label %for.body7.preheader

for.body7.preheader:                              ; preds = %for.body7.preheader.loopexit, %for.cond1.for.cond4_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %for.cond1.for.cond4_crit_edge ], [ 1297, %for.body7.preheader.loopexit ]
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7 ], [ %indvars.iv.ph, %for.body7.preheader ]
  %arrayidx9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  %41 = load double, double* %arrayidx9, align 8
  %42 = add nsw i64 %indvars.iv, -1
  %arrayidx14 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %42
  %43 = load double, double* %arrayidx14, align 8
  %add = fadd double %41, %43
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx19, align 8
  %add20 = fadd double %add, %44
  %arrayidx25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next3, i64 %indvars.iv
  %45 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add20, %45
  %arrayidx31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %indvars.iv
  %46 = load double, double* %arrayidx31, align 8
  %add32 = fadd double %add26, %46
  %mul = fmul double %add32, 2.000000e-01
  %arrayidx36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv2, i64 %indvars.iv
  store double %mul, double* %arrayidx36, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %for.end, label %for.body7, !llvm.loop !9

for.end:                                          ; preds = %for.body7
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1299
  %indvar.next38 = add i64 %indvar37, 1
  br i1 %exitcond5, label %for.cond40.for.cond44_crit_edge.preheader, label %for.cond1.for.cond4_crit_edge

for.cond40.for.cond44_crit_edge.preheader:        ; preds = %for.end
  br label %for.cond40.for.cond44_crit_edge

for.cond40.for.cond44_crit_edge:                  ; preds = %for.cond40.for.cond44_crit_edge.preheader, %for.end83
  %indvar = phi i64 [ %indvar.next, %for.end83 ], [ 0, %for.cond40.for.cond44_crit_edge.preheader ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.end83 ], [ 1, %for.cond40.for.cond44_crit_edge.preheader ]
  %47 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 1
  %scevgep16 = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 1299
  %scevgep18 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %48 = add i64 %indvar, 2
  %scevgep20 = getelementptr [1300 x double], [1300 x double]* %B, i64 %48, i64 1299
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %49 = add nsw i64 %indvars.iv10, -1
  %bound0 = icmp ult double* %scevgep, %scevgep20
  %bound1 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond40.for.cond44_crit_edge
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load, %wide.load24
  %60 = fadd <2 x double> %wide.load23, %wide.load25
  %61 = add nuw nsw i64 %offset.idx, 1
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %59, %wide.load26
  %67 = fadd <2 x double> %60, %wide.load27
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next11, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %66, %wide.load28
  %73 = fadd <2 x double> %67, %wide.load29
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %72, %wide.load30
  %79 = fadd <2 x double> %73, %wide.load31
  %80 = fmul <2 x double> %78, <double 2.000000e-01, double 2.000000e-01>
  %81 = fmul <2 x double> %79, <double 2.000000e-01, double 2.000000e-01>
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv10, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %80, <2 x double>* %83, align 8, !alias.scope !13, !noalias !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %81, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %86 = icmp eq i64 %index.next, 1296
  br i1 %86, label %for.body47.preheader.loopexit, label %vector.body, !llvm.loop !15

for.body47.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body47.preheader

for.body47.preheader:                             ; preds = %for.body47.preheader.loopexit, %for.cond40.for.cond44_crit_edge
  %indvars.iv6.ph = phi i64 [ 1, %for.cond40.for.cond44_crit_edge ], [ 1297, %for.body47.preheader.loopexit ]
  br label %for.body47

for.body47:                                       ; preds = %for.body47.preheader, %for.body47
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.body47 ], [ %indvars.iv6.ph, %for.body47.preheader ]
  %arrayidx51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv6
  %87 = load double, double* %arrayidx51, align 8
  %88 = add nsw i64 %indvars.iv6, -1
  %arrayidx56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %88
  %89 = load double, double* %arrayidx56, align 8
  %add57 = fadd double %87, %89
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %arrayidx62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv.next7
  %90 = load double, double* %arrayidx62, align 8
  %add63 = fadd double %add57, %90
  %arrayidx68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next11, i64 %indvars.iv6
  %91 = load double, double* %arrayidx68, align 8
  %add69 = fadd double %add63, %91
  %arrayidx74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %indvars.iv6
  %92 = load double, double* %arrayidx74, align 8
  %add75 = fadd double %add69, %92
  %mul76 = fmul double %add75, 2.000000e-01
  %arrayidx80 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv6
  store double %mul76, double* %arrayidx80, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1299
  br i1 %exitcond9, label %for.end83, label %for.body47, !llvm.loop !16

for.end83:                                        ; preds = %for.body47
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond13, label %for.end86, label %for.cond40.for.cond44_crit_edge

for.end86:                                        ; preds = %for.end83
  %inc88 = add nuw nsw i32 %0, 1
  %exitcond14 = icmp eq i32 %inc88, 500
  br i1 %exitcond14, label %for.end89, label %for.cond.for.cond1_crit_edge

for.end89:                                        ; preds = %for.end86
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond.for.cond2_crit_edge

for.cond.for.cond2_crit_edge:                     ; preds = %for.end, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv2, 1300
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond.for.cond2_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond2_crit_edge ], [ %indvars.iv.next, %if.end ]
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
  %arrayidx8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1300
  br i1 %exitcond5, label %for.end12, label %for.cond.for.cond2_crit_edge

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
