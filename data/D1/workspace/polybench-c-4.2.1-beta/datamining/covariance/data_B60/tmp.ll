; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %18 ]
  %4 = trunc i64 %indvars.iv4 to i32
  %5 = sitofp i32 %4 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = trunc i64 %indvars.iv.next to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %7, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %13 = insertelement <2 x double> undef, double %5, i32 0
  %14 = insertelement <2 x double> %13, double %5, i32 1
  %15 = fmul <2 x double> %14, %12
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %8 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) unnamed_addr #2 {
.lr.ph34..lr.ph34.split.us_crit_edge:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %sunkaddr103 = ptrtoint double* %5 to i64
  br label %.lr.ph34.split.us

.lr.ph34.split.us:                                ; preds = %._crit_edge30.us, %.lr.ph34..lr.ph34.split.us_crit_edge
  %indvars.iv69 = phi i64 [ 0, %.lr.ph34..lr.ph34.split.us_crit_edge ], [ %indvars.iv.next70, %._crit_edge30.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr78 = shl i64 %indvars.iv69, 3
  %sunkaddr79 = add i64 %sunkaddr, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %sunkaddr78.1 = shl i64 %indvars.iv69, 3
  %sunkaddr79.1 = add i64 %sunkaddr.1, %sunkaddr78.1
  %sunkaddr80.1 = inttoptr i64 %sunkaddr79.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph34.split.us
  %indvars.iv66 = phi i64 [ 0, %.lr.ph34.split.us ], [ %indvars.iv.next67.1, %._crit_edge ]
  %7 = phi double [ 0.000000e+00, %.lr.ph34.split.us ], [ %13, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv69
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr80, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next67, i64 %indvars.iv69
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr80.1, align 8
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67, 1399
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  br i1 %exitcond68.1, label %._crit_edge30.us, label %._crit_edge

._crit_edge30.us:                                 ; preds = %._crit_edge
  %14 = fdiv double %13, %2
  %sunkaddr104 = shl i64 %indvars.iv69, 3
  %sunkaddr105 = add i64 %sunkaddr103, %sunkaddr104
  %sunkaddr106 = inttoptr i64 %sunkaddr105 to double*
  store double %14, double* %sunkaddr106, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond102, label %._crit_edge30.us..preheader6.us_crit_edge, label %.lr.ph34.split.us

._crit_edge30.us..preheader6.us_crit_edge:        ; preds = %._crit_edge30.us
  %scevgep89 = getelementptr double, double* %5, i64 1200
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %._crit_edge30.us..preheader6.us_crit_edge
  %indvars.iv63 = phi i64 [ 0, %._crit_edge30.us..preheader6.us_crit_edge ], [ %15, %._crit_edge25.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 0
  %15 = add nuw nsw i64 %indvars.iv63, 1
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %3, i64 %15, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ugt double* %scevgep87, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader6.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader6.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %16 = getelementptr inbounds double, double* %5, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %index
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = fsub <2 x double> %wide.load93, %wide.load
  %25 = fsub <2 x double> %wide.load94, %wide.load92
  store <2 x double> %24, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %25, <2 x double>* %23, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %26 = getelementptr inbounds double, double* %5, i64 %index.next
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load92.1 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %index.next
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load93.1 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load94.1 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = fsub <2 x double> %wide.load93.1, %wide.load.1
  %35 = fsub <2 x double> %wide.load94.1, %wide.load92.1
  store <2 x double> %34, <2 x double>* %31, align 8, !alias.scope !4, !noalias !1
  store <2 x double> %35, <2 x double>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nsw i64 %index, 8
  %36 = icmp eq i64 %index.next.1, 1200
  br i1 %36, label %._crit_edge25.us.loopexit107, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv60 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next61.3, %scalar.ph ]
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv60
  %40 = load double, double* %39, align 8
  %41 = fsub double %40, %38
  store double %41, double* %39, align 8
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv.next61
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next61.1 = or i64 %indvars.iv60, 2
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61.1
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv.next61.1
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next61.2 = or i64 %indvars.iv60, 3
  %52 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next61.2
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv.next61.2
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %exitcond62.3 = icmp eq i64 %indvars.iv.next61.2, 1199
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  br i1 %exitcond62.3, label %._crit_edge25.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge25.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge25.us

._crit_edge25.us.loopexit107:                     ; preds = %vector.body
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit107, %._crit_edge25.us.loopexit
  %exitcond101 = icmp eq i64 %15, 1400
  br i1 %exitcond101, label %.preheader.lr.ph..preheader.us_crit_edge, label %.preheader6.us

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %._crit_edge25.us
  %57 = fadd double %2, -1.000000e+00
  br label %.lr.ph19.us

.lr.ph19.us:                                      ; preds = %._crit_edge20.us-lcssa.us.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv51 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next52, %._crit_edge20.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge20.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond100, label %._crit_edge22, label %.lr.ph19.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph19.us
  %indvars.iv49 = phi i64 [ %indvars.iv51, %.lr.ph19.us ], [ %indvars.iv.next50, %._crit_edge.us.us ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv51, i64 %indvars.iv49
  store double 0.000000e+00, double* %58, align 8
  br label %._crit_edge96

._crit_edge.us.us:                                ; preds = %._crit_edge96
  %59 = fdiv double %73, %57
  store double %59, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv51
  store double %59, double* %60, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond99, label %._crit_edge20.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge96:                                    ; preds = %._crit_edge96, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge96 ]
  %61 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %73, %._crit_edge96 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv51
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv49
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv51
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv49
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %58, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1399
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge96

._crit_edge22:                                    ; preds = %._crit_edge20.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv6, 1200
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
