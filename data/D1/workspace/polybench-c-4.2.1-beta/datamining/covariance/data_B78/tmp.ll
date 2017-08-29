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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv3 = phi i64 [ 0, %3 ], [ %indvars.iv.next4, %19 ]
  %4 = trunc i64 %indvars.iv3 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond5, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph81.split.us.preheader:
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr165 = ptrtoint double* %5 to i64
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %._crit_edge78.us, %.lr.ph81.split.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph81.split.us.preheader ], [ %indvars.iv.next118, %._crit_edge78.us ]
  %6 = getelementptr inbounds double, double* %5, i64 %indvars.iv117
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr134 = shl i64 %indvars.iv117, 3
  %sunkaddr135 = add i64 %sunkaddr, %sunkaddr134
  %sunkaddr136 = inttoptr i64 %sunkaddr135 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph81.split.us
  %indvars.iv114 = phi i64 [ 0, %.lr.ph81.split.us ], [ %indvars.iv.next115.3, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv114, i64 %indvars.iv117
  %8 = load double, double* %7, align 8
  %9 = load double, double* %sunkaddr136, align 8
  %10 = fadd double %8, %9
  store double %10, double* %sunkaddr136, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next115, i64 %indvars.iv117
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr136, align 8
  %indvars.iv.next115.1 = or i64 %indvars.iv114, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next115.1, i64 %indvars.iv117
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr136, align 8
  %indvars.iv.next115.2 = or i64 %indvars.iv114, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next115.2, i64 %indvars.iv117
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr136, align 8
  %indvars.iv.next115.3 = add nuw nsw i64 %indvars.iv114, 4
  %exitcond116.3 = icmp eq i64 %indvars.iv.next115.3, 1400
  br i1 %exitcond116.3, label %._crit_edge78.us, label %._crit_edge

._crit_edge78.us:                                 ; preds = %._crit_edge
  %20 = fdiv double %19, %2
  %sunkaddr166 = shl i64 %indvars.iv117, 3
  %sunkaddr167 = add i64 %sunkaddr165, %sunkaddr166
  %sunkaddr168 = inttoptr i64 %sunkaddr167 to double*
  store double %20, double* %sunkaddr168, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next118, 1200
  br i1 %exitcond119, label %._crit_edge78.us..preheader63.us_crit_edge, label %.lr.ph81.split.us

._crit_edge78.us..preheader63.us_crit_edge:       ; preds = %._crit_edge78.us
  %scevgep151 = getelementptr double, double* %5, i64 1200
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %._crit_edge73.us, %._crit_edge78.us..preheader63.us_crit_edge
  %indvars.iv110 = phi i64 [ 0, %._crit_edge78.us..preheader63.us_crit_edge ], [ %21, %._crit_edge73.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 0
  %21 = add nuw nsw i64 %indvars.iv110, 1
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %3, i64 %21, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep151
  %bound1 = icmp ugt double* %scevgep149, %5
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader63.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader63.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %22 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec156 = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = fsub <8 x double> %wide.vec156, %wide.vec
  %27 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %28 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %29 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %30 = or i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %30
  %32 = shufflevector <8 x double> %26, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %37 = icmp eq i64 %index.next, 300
  br i1 %37, label %._crit_edge73.us.loopexit169, label %vector.body, !llvm.loop !6

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.3, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv107
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv107
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next108
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv.next108
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next108.1 = or i64 %indvars.iv107, 2
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next108.1
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv.next108.1
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next108.2 = or i64 %indvars.iv107, 3
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next108.2
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv110, i64 %indvars.iv.next108.2
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next108.3 = add nuw nsw i64 %indvars.iv107, 4
  %exitcond109.3 = icmp eq i64 %indvars.iv.next108.3, 1200
  br i1 %exitcond109.3, label %._crit_edge73.us.loopexit, label %scalar.ph, !llvm.loop !9

._crit_edge73.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge73.us

._crit_edge73.us.loopexit169:                     ; preds = %vector.body
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit169, %._crit_edge73.us.loopexit
  %exitcond112 = icmp eq i64 %21, 1400
  br i1 %exitcond112, label %.preheader.us.preheader, label %.preheader63.us

.preheader.us.preheader:                          ; preds = %._crit_edge73.us
  %58 = fadd double %2, -1.000000e+00
  br label %.lr.ph67.us

.lr.ph67.us:                                      ; preds = %._crit_edge68.us-lcssa.us.us, %.preheader.us.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next97, %._crit_edge68.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next97, 1200
  br i1 %exitcond98, label %._crit_edge70, label %.lr.ph67.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph67.us
  %indvars.iv93 = phi i64 [ %indvars.iv96, %.lr.ph67.us ], [ %indvars.iv.next94, %._crit_edge.us.us ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv96, i64 %indvars.iv93
  store double 0.000000e+00, double* %59, align 8
  br label %._crit_edge162

._crit_edge.us.us:                                ; preds = %._crit_edge162
  %60 = fdiv double %74, %58
  store double %60, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv96
  store double %60, double* %61, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next94, 1200
  br i1 %exitcond95, label %._crit_edge68.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge162:                                   ; preds = %._crit_edge162, %.lr.ph.us.us
  %62 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %74, %._crit_edge162 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge162 ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv96
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv93
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %59, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv96
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv93
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %68, %73
  store double %74, double* %59, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge162

._crit_edge70:                                    ; preds = %._crit_edge68.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge13.us ]
  %6 = mul nuw nsw i64 %indvars.iv16, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %._crit_edge.us._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge13.us, label %._crit_edge.us._crit_edge

._crit_edge13.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
