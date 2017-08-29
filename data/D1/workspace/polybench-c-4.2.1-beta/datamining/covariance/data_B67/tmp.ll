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

.preheader:                                       ; preds = %19, %3
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %19 ], [ 0, %3 ]
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
  %exitcond = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
.lr.ph30.split.us.preheader:
  %6 = alloca double, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  store double %2, double* %6, align 8
  store [1200 x double]* %3, [1200 x double]** %7, align 8
  store [1200 x double]* %4, [1200 x double]** %8, align 8
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %sunkaddr110 = ptrtoint double* %5 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge27.us ], [ 0, %.lr.ph30.split.us.preheader ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv107
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr75 = shl nsw i64 %indvars.iv107, 3
  %sunkaddr76 = add i64 %sunkaddr, %sunkaddr75
  %sunkaddr77 = inttoptr i64 %sunkaddr76 to double*
  %sunkaddr75.1 = shl nsw i64 %indvars.iv107, 3
  %sunkaddr76.1 = add i64 %sunkaddr.1, %sunkaddr75.1
  %sunkaddr77.1 = inttoptr i64 %sunkaddr76.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph30.split.us
  %indvars.iv63 = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next64.1.1, %._crit_edge ]
  %10 = phi double [ 0.000000e+00, %.lr.ph30.split.us ], [ %22, %._crit_edge ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv63, i64 %indvars.iv107
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr77, align 8
  %indvars.iv.next64 = or i64 %indvars.iv63, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next64, i64 %indvars.iv107
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr77, align 8
  %indvars.iv.next64.1 = or i64 %indvars.iv63, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next64.1, i64 %indvars.iv107
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr77.1, align 8
  %indvars.iv.next64.1117 = or i64 %indvars.iv63, 3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next64.1117, i64 %indvars.iv107
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr77.1, align 8
  %indvars.iv.next64.1.1 = add nsw i64 %indvars.iv63, 4
  %exitcond65.1.1 = icmp eq i64 %indvars.iv.next64.1.1, 1400
  br i1 %exitcond65.1.1, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %23 = fdiv double %22, %2
  %sunkaddr111 = shl i64 %indvars.iv107, 3
  %sunkaddr112 = add i64 %sunkaddr110, %sunkaddr111
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to double*
  store double %23, double* %sunkaddr113, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next108, 1200
  br i1 %exitcond109, label %._crit_edge27.us..preheader8.us_crit_edge, label %.lr.ph30.split.us

._crit_edge27.us..preheader8.us_crit_edge:        ; preds = %._crit_edge27.us
  %scevgep87 = getelementptr double, double* %5, i64 1200
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge23.us, %._crit_edge27.us..preheader8.us_crit_edge
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge23.us ], [ 0, %._crit_edge27.us..preheader8.us_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 0
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next105, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ugt double* %scevgep85, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge69.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader8.us
  br label %vector.body

._crit_edge69.preheader:                          ; preds = %.preheader8.us
  br label %._crit_edge69

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %24 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %offset.idx
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec92 = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = fsub <8 x double> %wide.vec92, %wide.vec
  %29 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %30 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %31 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %32 = or i64 %offset.idx, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %32
  %34 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = shufflevector <2 x double> %29, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <2 x double> %31, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %37, <4 x double> %38, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %39 = icmp eq i64 %index.next, 300
  br i1 %39, label %._crit_edge23.us.loopexit114, label %vector.body, !llvm.loop !6

._crit_edge69:                                    ; preds = %._crit_edge69.preheader, %._crit_edge69
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.3, %._crit_edge69 ], [ 0, %._crit_edge69.preheader ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv59
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv.next60
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next60.1 = or i64 %indvars.iv59, 2
  %50 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60.1
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv.next60.1
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next60.2 = or i64 %indvars.iv59, 3
  %55 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next60.2
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv104, i64 %indvars.iv.next60.2
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next60.3 = add nuw nsw i64 %indvars.iv59, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next60.3, 1200
  br i1 %exitcond61.3, label %._crit_edge23.us.loopexit, label %._crit_edge69, !llvm.loop !9

._crit_edge23.us.loopexit:                        ; preds = %._crit_edge69
  br label %._crit_edge23.us

._crit_edge23.us.loopexit114:                     ; preds = %vector.body
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit114, %._crit_edge23.us.loopexit
  %exitcond106 = icmp eq i64 %indvars.iv.next105, 1400
  br i1 %exitcond106, label %.lr.ph19.us.preheader, label %.preheader8.us

.lr.ph19.us.preheader:                            ; preds = %._crit_edge23.us
  br label %.lr.ph19.us

.lr.ph19.us:                                      ; preds = %.lr.ph19.us.preheader, %._crit_edge20.us-lcssa.us.us
  %indvars.iv100 = phi i64 [ 0, %.lr.ph19.us.preheader ], [ %indvars.iv.next101, %._crit_edge20.us-lcssa.us.us ]
  %60 = phi [1200 x double]* [ %4, %.lr.ph19.us.preheader ], [ %64, %._crit_edge20.us-lcssa.us.us ]
  br label %.lr.ph.us.us

._crit_edge20.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next101, 1200
  br i1 %exitcond50, label %._crit_edge21, label %.lr.ph19.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph19.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge.us.us ], [ %indvars.iv100, %.lr.ph19.us ]
  %61 = phi [1200 x double]* [ %64, %._crit_edge.us.us ], [ %60, %.lr.ph19.us ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv100, i64 %indvars.iv102
  store double 0.000000e+00, double* %62, align 8
  %63 = load [1200 x double]*, [1200 x double]** %7, align 8
  %64 = load [1200 x double]*, [1200 x double]** %8, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv100, i64 %indvars.iv102
  %.pre = load double, double* %65, align 8
  br label %._crit_edge70

._crit_edge.us.us:                                ; preds = %._crit_edge70
  %66 = load double, double* %6, align 8
  %67 = fadd double %66, -1.000000e+00
  %68 = fdiv double %82, %67
  store double %68, double* %65, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv102, i64 %indvars.iv100
  store double %68, double* %69, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond = icmp eq i64 %indvars.iv.next103, 1200
  br i1 %exitcond, label %._crit_edge20.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge70:                                    ; preds = %._crit_edge70, %.lr.ph.us.us
  %70 = phi double [ %.pre, %.lr.ph.us.us ], [ %82, %._crit_edge70 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge70 ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv, i64 %indvars.iv100
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv, i64 %indvars.iv102
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = fadd double %75, %70
  store double %76, double* %65, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv.next, i64 %indvars.iv100
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv.next, i64 %indvars.iv102
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, %76
  store double %82, double* %65, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge70

._crit_edge21:                                    ; preds = %._crit_edge20.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge4

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
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
