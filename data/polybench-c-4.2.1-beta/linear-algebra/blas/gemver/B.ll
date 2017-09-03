; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  tail call fastcc void @print_array(i32 2000, double* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  tail call void @free(i8* %10) #4
  tail call void @free(i8* %11) #4
  tail call void @free(i8* %12) #4
  tail call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph4.split.us.preheader:
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %..loopexit_crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next7, %..loopexit_crit_edge.us ]
  %12 = trunc i64 %indvars.iv6 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv6
  store double %13, double* %14, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %15 = trunc i64 %indvars.iv.next7 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv6
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv6
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %7, i64 %indvars.iv6
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %10, i64 %indvars.iv6
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %11, i64 %indvars.iv6
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %9, i64 %indvars.iv6
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %8, i64 %indvars.iv6
  store double 0.000000e+00, double* %29, align 8
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next.1, %30 ]
  %31 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 2000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 2.000000e+03
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %37 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 2.000000e+03
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %41, double* %42, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %30

..loopexit_crit_edge.us:                          ; preds = %30
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %._crit_edge, label %.lr.ph4.split.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader8.us.preheader:
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr45 = ptrtoint double* %6 to i64
  %scevgep60 = getelementptr double, double* %5, i64 2000
  %scevgep62 = getelementptr double, double* %7, i64 2000
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge20.us, %.preheader8.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader8.us.preheader ], [ %12, %._crit_edge20.us ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv40, i64 0
  %scevgep57 = bitcast double* %scevgep to i8*
  %12 = add nuw nsw i64 %indvars.iv40, 1
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %3, i64 %12, i64 0
  %scevgep5859 = bitcast double* %scevgep58 to i8*
  %sunkaddr42 = shl i64 %indvars.iv40, 3
  %sunkaddr43 = add i64 %sunkaddr, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  %sunkaddr47 = add i64 %sunkaddr45, %sunkaddr42
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %bc = inttoptr i64 %sunkaddr43 to i8*
  %bound0 = icmp ult i8* %scevgep57, %bc
  %bound1 = icmp ult i8* %bc, %scevgep5859
  %found.conflict = and i1 %bound0, %bound1
  %bound065 = icmp ult double* %scevgep, %scevgep60
  %bound166 = icmp ugt double* %scevgep58, %5
  %found.conflict67 = and i1 %bound065, %bound166
  %conflict.rdx = or i1 %found.conflict, %found.conflict67
  %bc68 = inttoptr i64 %sunkaddr47 to i8*
  %bound070 = icmp ult i8* %scevgep57, %bc68
  %bound171 = icmp ult i8* %bc68, %scevgep5859
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx73 = or i1 %conflict.rdx, %found.conflict72
  %bound074 = icmp ult double* %scevgep, %scevgep62
  %bound175 = icmp ugt double* %scevgep58, %7
  %found.conflict76 = and i1 %bound074, %bound175
  %conflict.rdx77 = or i1 %conflict.rdx73, %found.conflict76
  br i1 %conflict.rdx77, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader8.us
  %.pre = load double, double* %sunkaddr44, align 8, !alias.scope !1
  %.pre116 = load double, double* %sunkaddr48, align 8, !alias.scope !4
  %13 = insertelement <2 x double> undef, double %.pre, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %.pre116, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader8.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv40, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !6, !noalias !8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !6, !noalias !8
  %21 = getelementptr inbounds double, double* %5, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !11
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !11
  %25 = fmul <2 x double> %14, %wide.load80
  %26 = fmul <2 x double> %14, %wide.load81
  %27 = fadd <2 x double> %wide.load, %25
  %28 = fadd <2 x double> %wide.load79, %26
  %29 = getelementptr inbounds double, double* %7, i64 %index
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !12
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !12
  %33 = fmul <2 x double> %16, %wide.load82
  %34 = fmul <2 x double> %16, %wide.load83
  %35 = fadd <2 x double> %27, %33
  %36 = fadd <2 x double> %28, %34
  store <2 x double> %35, <2 x double>* %18, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %36, <2 x double>* %20, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %37 = icmp eq i64 %index.next, 2000
  br i1 %37, label %._crit_edge20.us.loopexit115, label %vector.body, !llvm.loop !13

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv36 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next37.1, %scalar.ph ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv36
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr44, align 8
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv36
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %39, %43
  %45 = load double, double* %sunkaddr48, align 8
  %46 = getelementptr inbounds double, double* %7, i64 %indvars.iv36
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %44, %48
  store double %49, double* %38, align 8
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next37
  %51 = load double, double* %50, align 8
  %52 = load double, double* %sunkaddr44, align 8
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next37
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %51, %55
  %57 = load double, double* %sunkaddr48, align 8
  %58 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next37
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %56, %60
  store double %61, double* %50, align 8
  %exitcond39.1 = icmp eq i64 %indvars.iv.next37, 1999
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  br i1 %exitcond39.1, label %._crit_edge20.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge20.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge20.us

._crit_edge20.us.loopexit115:                     ; preds = %vector.body
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit115, %._crit_edge20.us.loopexit
  %exitcond113 = icmp eq i64 %12, 2000
  br i1 %exitcond113, label %.preheader6.us.preheader, label %.preheader8.us

.preheader6.us.preheader:                         ; preds = %._crit_edge20.us
  %sunkaddr49 = ptrtoint double* %9 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge16.us, %.preheader6.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  %sunkaddr50 = shl i64 %indvars.iv34, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %.pre117 = load double, double* %sunkaddr52, align 8
  br label %62

; <label>:62:                                     ; preds = %62, %.preheader6.us
  %63 = phi double [ %.pre117, %.preheader6.us ], [ %77, %62 ]
  %indvars.iv30 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next31.1, %62 ]
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv30, i64 %indvars.iv34
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, %2
  %67 = getelementptr inbounds double, double* %10, i64 %indvars.iv30
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %63, %69
  store double %70, double* %sunkaddr52, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next31, i64 %indvars.iv34
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %2
  %74 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next31
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %70, %76
  store double %77, double* %sunkaddr52, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31, 1999
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  br i1 %exitcond33.1, label %._crit_edge16.us, label %62

._crit_edge16.us:                                 ; preds = %62
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond112, label %vector.memcheck97, label %.preheader6.us

vector.memcheck97:                                ; preds = %._crit_edge16.us
  %scevgep89 = getelementptr double, double* %9, i64 2000
  %scevgep91 = getelementptr double, double* %11, i64 2000
  %bound093 = icmp ugt double* %scevgep91, %9
  %bound194 = icmp ugt double* %scevgep89, %11
  %memcheck.conflict96 = and i1 %bound093, %bound194
  br i1 %memcheck.conflict96, label %.lr.ph13.preheader, label %vector.body84.preheader

vector.body84.preheader:                          ; preds = %vector.memcheck97
  br label %vector.body84

.lr.ph13.preheader:                               ; preds = %vector.memcheck97
  br label %.lr.ph13

vector.body84:                                    ; preds = %vector.body84, %vector.body84.preheader
  %index99 = phi i64 [ 0, %vector.body84.preheader ], [ %index.next100.1, %vector.body84 ]
  %78 = getelementptr inbounds double, double* %9, i64 %index99
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !17, !noalias !20
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !17, !noalias !20
  %82 = getelementptr inbounds double, double* %11, i64 %index99
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !20
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !20
  %86 = fadd <2 x double> %wide.load107, %wide.load109
  %87 = fadd <2 x double> %wide.load108, %wide.load110
  store <2 x double> %86, <2 x double>* %79, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %87, <2 x double>* %81, align 8, !alias.scope !17, !noalias !20
  %index.next100 = or i64 %index99, 4
  %88 = getelementptr inbounds double, double* %9, i64 %index.next100
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load107.1 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !17, !noalias !20
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load108.1 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !17, !noalias !20
  %92 = getelementptr inbounds double, double* %11, i64 %index.next100
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load109.1 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !20
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load110.1 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !20
  %96 = fadd <2 x double> %wide.load107.1, %wide.load109.1
  %97 = fadd <2 x double> %wide.load108.1, %wide.load110.1
  store <2 x double> %96, <2 x double>* %89, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %97, <2 x double>* %91, align 8, !alias.scope !17, !noalias !20
  %index.next100.1 = add nsw i64 %index99, 8
  %98 = icmp eq i64 %index.next100.1, 2000
  br i1 %98, label %.preheader.us.preheader.loopexit114, label %vector.body84, !llvm.loop !22

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %sunkaddr54 = shl i64 %indvars.iv24, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %.pre118 = load double, double* %sunkaddr56, align 8
  br label %99

; <label>:99:                                     ; preds = %99, %.preheader.us
  %100 = phi double [ %.pre118, %.preheader.us ], [ %114, %99 ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %99 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %1
  %104 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = fadd double %100, %106
  store double %107, double* %sunkaddr56, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %1
  %111 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fadd double %107, %113
  store double %114, double* %sunkaddr56, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us, label %99

._crit_edge.us:                                   ; preds = %99
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next25, 2000
  br i1 %exitcond111, label %._crit_edge11, label %.preheader.us

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader
  %indvars.iv26 = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next27.4, %.lr.ph13 ]
  %115 = getelementptr inbounds double, double* %9, i64 %indvars.iv26
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %11, i64 %indvars.iv26
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  store double %119, double* %115, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %120 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  store double %124, double* %120, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %125 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27.1
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27.1
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  store double %129, double* %125, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %130 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27.2
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27.2
  %133 = load double, double* %132, align 8
  %134 = fadd double %131, %133
  store double %134, double* %130, align 8
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  %135 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next27.3
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next27.3
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  store double %139, double* %135, align 8
  %exitcond29.4 = icmp eq i64 %indvars.iv.next27.3, 1999
  %indvars.iv.next27.4 = add nsw i64 %indvars.iv26, 5
  br i1 %exitcond29.4, label %.preheader.us.preheader.loopexit, label %.lr.ph13, !llvm.loop !23

.preheader.us.preheader.loopexit:                 ; preds = %.lr.ph13
  br label %.preheader.us.preheader

.preheader.us.preheader.loopexit114:              ; preds = %vector.body84
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit114, %.preheader.us.preheader.loopexit
  %sunkaddr53 = ptrtoint double* %8 to i64
  br label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
