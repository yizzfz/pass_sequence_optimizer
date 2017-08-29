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
  %indvars.iv2 = phi i64 [ 0, %3 ], [ %indvars.iv.next3, %19 ]
  %4 = trunc i64 %indvars.iv2 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv
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
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond4, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph35.split.us.preheader:
  %6 = alloca double, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  store double %2, double* %6, align 8
  store [1200 x double]* %3, [1200 x double]** %7, align 8
  store [1200 x double]* %4, [1200 x double]** %8, align 8
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr105 = ptrtoint double* %5 to i64
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %._crit_edge32.us, %.lr.ph35.split.us.preheader
  %indvars.iv68 = phi i64 [ 0, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next69, %._crit_edge32.us ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr80 = shl i64 %indvars.iv68, 3
  %sunkaddr81 = add i64 %sunkaddr, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph35.split.us
  %indvars.iv65 = phi i64 [ 0, %.lr.ph35.split.us ], [ %indvars.iv.next66.4, %._crit_edge ]
  %10 = phi double [ 0.000000e+00, %.lr.ph35.split.us ], [ %25, %._crit_edge ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv65, i64 %indvars.iv68
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr82, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next66, i64 %indvars.iv68
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr82, align 8
  %indvars.iv.next66.1 = add nuw nsw i64 %indvars.iv65, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next66.1, i64 %indvars.iv68
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr82, align 8
  %indvars.iv.next66.2 = add nuw nsw i64 %indvars.iv65, 3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next66.2, i64 %indvars.iv68
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr82, align 8
  %indvars.iv.next66.3 = add nuw nsw i64 %indvars.iv65, 4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next66.3, i64 %indvars.iv68
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  store double %25, double* %sunkaddr82, align 8
  %indvars.iv.next66.4 = add nuw nsw i64 %indvars.iv65, 5
  %exitcond67.4 = icmp eq i64 %indvars.iv.next66.4, 1400
  br i1 %exitcond67.4, label %._crit_edge32.us, label %._crit_edge

._crit_edge32.us:                                 ; preds = %._crit_edge
  %26 = fdiv double %25, %2
  %sunkaddr106 = shl i64 %indvars.iv68, 3
  %sunkaddr107 = add i64 %sunkaddr105, %sunkaddr106
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to double*
  store double %26, double* %sunkaddr108, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 1200
  br i1 %exitcond70, label %._crit_edge32.us..preheader8.us_crit_edge, label %.lr.ph35.split.us

._crit_edge32.us..preheader8.us_crit_edge:        ; preds = %._crit_edge32.us
  %scevgep92 = getelementptr double, double* %5, i64 1200
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge28.us, %._crit_edge32.us..preheader8.us_crit_edge
  %indvars.iv61 = phi i64 [ 0, %._crit_edge32.us..preheader8.us_crit_edge ], [ %27, %._crit_edge28.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 0
  %27 = add nuw nsw i64 %indvars.iv61, 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %3, i64 %27, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep92
  %bound1 = icmp ugt double* %scevgep90, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge74.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader8.us
  br label %vector.body

._crit_edge74.preheader:                          ; preds = %.preheader8.us
  br label %._crit_edge74

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %28 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %29 = bitcast double* %28 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %offset.idx
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec97 = load <8 x double>, <8 x double>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = fsub <8 x double> %wide.vec97, %wide.vec
  %33 = shufflevector <8 x double> %32, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %34 = shufflevector <8 x double> %32, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %35 = shufflevector <8 x double> %32, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %36 = or i64 %offset.idx, 3
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %36
  %38 = shufflevector <8 x double> %32, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %39 = getelementptr double, double* %37, i64 -3
  %40 = bitcast double* %39 to <8 x double>*
  %41 = shufflevector <2 x double> %33, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %42 = shufflevector <2 x double> %35, <2 x double> %38, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %41, <4 x double> %42, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %43 = icmp eq i64 %index.next, 300
  br i1 %43, label %._crit_edge28.us.loopexit109, label %vector.body, !llvm.loop !6

._crit_edge74:                                    ; preds = %._crit_edge74.preheader, %._crit_edge74
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %._crit_edge74 ], [ 0, %._crit_edge74.preheader ]
  %44 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv58
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next59 = or i64 %indvars.iv58, 1
  %49 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv.next59
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next59.1 = or i64 %indvars.iv58, 2
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv.next59.1
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next59.2 = or i64 %indvars.iv58, 3
  %59 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv61, i64 %indvars.iv.next59.2
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next59.3 = add nuw nsw i64 %indvars.iv58, 4
  %exitcond60.3 = icmp eq i64 %indvars.iv.next59.3, 1200
  br i1 %exitcond60.3, label %._crit_edge28.us.loopexit, label %._crit_edge74, !llvm.loop !9

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge74
  br label %._crit_edge28.us

._crit_edge28.us.loopexit109:                     ; preds = %vector.body
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit109, %._crit_edge28.us.loopexit
  %exitcond63 = icmp eq i64 %27, 1400
  br i1 %exitcond63, label %.lr.ph19.us.preheader, label %.preheader8.us

.lr.ph19.us.preheader:                            ; preds = %._crit_edge28.us
  br label %.lr.ph19.us

._crit_edge20.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 1200
  br i1 %exitcond49, label %._crit_edge21, label %.lr.ph19.us

.lr.ph19.us:                                      ; preds = %.lr.ph19.us.preheader, %._crit_edge20.us-lcssa.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge20.us-lcssa.us.us ], [ 0, %.lr.ph19.us.preheader ]
  %64 = phi [1200 x double]* [ %68, %._crit_edge20.us-lcssa.us.us ], [ %4, %.lr.ph19.us.preheader ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph19.us
  %indvars.iv44 = phi i64 [ %indvars.iv47, %.lr.ph19.us ], [ %indvars.iv.next45, %._crit_edge.us.us ]
  %65 = phi [1200 x double]* [ %64, %.lr.ph19.us ], [ %68, %._crit_edge.us.us ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv47, i64 %indvars.iv44
  store double 0.000000e+00, double* %66, align 8
  %67 = load [1200 x double]*, [1200 x double]** %7, align 8
  %68 = load [1200 x double]*, [1200 x double]** %8, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv47, i64 %indvars.iv44
  %.pre = load double, double* %69, align 8
  br label %._crit_edge75

._crit_edge.us.us:                                ; preds = %._crit_edge75
  %70 = load double, double* %6, align 8
  %71 = fadd double %70, -1.000000e+00
  %72 = fdiv double %86, %71
  store double %72, double* %69, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv44, i64 %indvars.iv47
  store double %72, double* %73, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond46, label %._crit_edge20.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge75:                                    ; preds = %._crit_edge75, %.lr.ph.us.us
  %74 = phi double [ %.pre, %.lr.ph.us.us ], [ %86, %._crit_edge75 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge75 ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv, i64 %indvars.iv47
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv, i64 %indvars.iv44
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, %74
  store double %80, double* %69, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv.next, i64 %indvars.iv47
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv.next, i64 %indvars.iv44
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, %80
  store double %86, double* %69, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge75

._crit_edge21:                                    ; preds = %._crit_edge20.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge.us ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
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
