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
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i8*, align 8
  %8 = alloca [1200 x [1200 x double]]*, align 8
  %9 = alloca [1200 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1200, i32* %5, align 4
  %10 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  store i8* %10, i8** %7, align 8
  %11 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %12 = bitcast [1200 x [1200 x double]]** %8 to i8**
  store i8* %11, i8** %12, align 8
  %13 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %14 = bitcast [1200 x double]** %9 to i8**
  store i8* %13, i8** %14, align 8
  %15 = bitcast i8* %10 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %6, [1200 x double]* %15)
  call void (...) @polybench_timer_start() #4
  %16 = load double, double* %6, align 8
  %17 = bitcast [1200 x [1200 x double]]** %8 to [1200 x double]**
  %18 = load [1200 x double]*, [1200 x double]** %17, align 8
  %19 = bitcast [1200 x double]** %9 to double**
  %20 = load double*, double** %19, align 8
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %16, [1200 x double]* %15, [1200 x double]* %18, double* %20)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %21 = load i32, i32* %3, align 4
  %22 = icmp sgt i32 %21, 42
  %23 = bitcast [1200 x double]* %18 to i8*
  %24 = bitcast double* %20 to i8*
  br i1 %22, label %25, label %._crit_edge

; <label>:25:                                     ; preds = %2
  %26 = load i8**, i8*** %4, align 8
  %27 = load i8*, i8** %26, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %5, align 4
  call fastcc void @print_array(i32 %30, [1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %25, %2, %29
  %31 = load i8*, i8** %7, align 8
  call void @free(i8* %31) #4
  call void @free(i8* %23) #4
  call void @free(i8* %24) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %20, %3
  %indvars.iv6 = phi i64 [ 0, %3 ], [ %indvars.iv.next7, %20 ]
  %4 = trunc i64 %indvars.iv6 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %8 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %12 = trunc i64 %indvars.iv to i32
  %13 = or i32 %12, 1
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %16, %7
  %18 = fdiv <2 x double> %17, <double 1.200000e+03, double 1.200000e+03>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %8

; <label>:20:                                     ; preds = %8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1400
  br i1 %exitcond8, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #2 {
.lr.ph52:
  br label %.lr.ph52.split.us

.lr.ph52.split.us:                                ; preds = %._crit_edge47.us, %.lr.ph52
  %indvars.iv94 = phi i64 [ 0, %.lr.ph52 ], [ %indvars.iv.next95, %._crit_edge47.us ]
  %sext115 = shl i64 %indvars.iv94, 32
  %6 = ashr exact i64 %sext115, 32
  %7 = getelementptr inbounds double, double* %5, i64 %6
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds double, double* %5, i64 %indvars.iv94
  %.pre124 = load double, double* %8, align 8
  br label %.lr.ph52.split.us.new

.lr.ph52.split.us.new:                            ; preds = %.lr.ph52.split.us, %.lr.ph52.split.us.new
  %9 = phi double [ %21, %.lr.ph52.split.us.new ], [ %.pre124, %.lr.ph52.split.us ]
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.3, %.lr.ph52.split.us.new ], [ 0, %.lr.ph52.split.us ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv90, i64 %indvars.iv94
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %8, align 8
  %indvars.iv.next91 = or i64 %indvars.iv90, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next91, i64 %indvars.iv94
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %8, align 8
  %indvars.iv.next91.1 = or i64 %indvars.iv90, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next91.1, i64 %indvars.iv94
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %8, align 8
  %indvars.iv.next91.2 = or i64 %indvars.iv90, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next91.2, i64 %indvars.iv94
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %8, align 8
  %indvars.iv.next91.3 = add nuw nsw i64 %indvars.iv90, 4
  %exitcond93.3 = icmp eq i64 %indvars.iv.next91.3, 1400
  br i1 %exitcond93.3, label %._crit_edge47.us, label %.lr.ph52.split.us.new

._crit_edge47.us:                                 ; preds = %.lr.ph52.split.us.new
  %22 = fdiv double %21, %2
  store double %22, double* %8, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond208 = icmp eq i64 %indvars.iv.next95, 1200
  br i1 %exitcond208, label %.preheader8.us.preheader, label %.lr.ph52.split.us

.preheader8.us.preheader:                         ; preds = %._crit_edge47.us
  %scevgep148 = getelementptr double, double* %5, i64 1200
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge37.us, %.preheader8.us.preheader
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge37.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 0
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 1200
  %bound0 = icmp ult double* %scevgep, %scevgep148
  %bound1 = icmp ugt double* %scevgep143, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader8.us.new.preheader, label %vector.body135.preheader

vector.body135.preheader:                         ; preds = %.preheader8.us
  br label %vector.body135

.preheader8.us.new.preheader:                     ; preds = %.preheader8.us
  br label %.preheader8.us.new

vector.body135:                                   ; preds = %vector.body135.preheader, %vector.body135
  %index151 = phi i64 [ %index.next152, %vector.body135 ], [ 0, %vector.body135.preheader ]
  %23 = shl i64 %index151, 2
  %24 = getelementptr inbounds double, double* %5, i64 %23
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %23
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec162 = load <8 x double>, <8 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = fsub <8 x double> %wide.vec162, %wide.vec
  %29 = shufflevector <8 x double> %28, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %30 = fsub <8 x double> %wide.vec162, %wide.vec
  %31 = shufflevector <8 x double> %30, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %32 = fsub <8 x double> %wide.vec162, %wide.vec
  %33 = shufflevector <8 x double> %32, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %34 = or i64 %23, 3
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %34
  %36 = fsub <8 x double> %wide.vec162, %wide.vec
  %37 = shufflevector <8 x double> %36, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %38 = getelementptr double, double* %35, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %29, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %33, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next152 = add nuw nsw i64 %index151, 2
  %42 = icmp eq i64 %index.next152, 300
  br i1 %42, label %._crit_edge37.us.loopexit203, label %vector.body135, !llvm.loop !6

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.3, %.preheader8.us.new ], [ 0, %.preheader8.us.new.preheader ]
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv84
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next85 = or i64 %indvars.iv84, 1
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv.next85
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next85.1 = or i64 %indvars.iv84, 2
  %53 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.1
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv.next85.1
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next85.2 = or i64 %indvars.iv84, 3
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.2
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv88, i64 %indvars.iv.next85.2
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next85.3 = add nuw nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, 1200
  br i1 %exitcond87.3, label %._crit_edge37.us.loopexit, label %.preheader8.us.new, !llvm.loop !9

._crit_edge37.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge37.us

._crit_edge37.us.loopexit203:                     ; preds = %vector.body135
  br label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %._crit_edge37.us.loopexit203, %._crit_edge37.us.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond207 = icmp eq i64 %indvars.iv.next89, 1400
  br i1 %exitcond207, label %.preheader.lr.ph, label %.preheader8.us

.preheader.lr.ph:                                 ; preds = %._crit_edge37.us
  %63 = fadd double %2, -1.000000e+00
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge13.us-lcssa.us.us, %.preheader.lr.ph
  %indvars.iv205 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next206, %._crit_edge13.us-lcssa.us.us ]
  br i1 true, label %.lr.ph12.us, label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  br label %._crit_edge13.us-lcssa.us.us

._crit_edge13.us-lcssa.us.us:                     ; preds = %._crit_edge13.us-lcssa.us.us.loopexit, %.preheader.us
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %exitcond = icmp eq i64 %indvars.iv.next206, 1200
  br i1 %exitcond, label %._crit_edge19, label %.preheader.us

.lr.ph12.us:                                      ; preds = %.preheader.us
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph12.us
  %indvars.iv72 = phi i64 [ %indvars.iv205, %.lr.ph12.us ], [ %indvars.iv.next73, %._crit_edge.us.us ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv205, i64 %indvars.iv72
  store double 0.000000e+00, double* %64, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %65 = fdiv double %79, %63
  store double %65, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv205
  store double %65, double* %66, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond75, label %._crit_edge13.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %67 = phi double [ %79, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv205
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv72
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, %67
  store double %73, double* %64, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv205
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv72
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %78, %73
  store double %79, double* %64, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge19:                                    ; preds = %._crit_edge13.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %9 = mul nsw i64 %indvars.iv12, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.us, label %10

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, %8
  br i1 %exitcond14, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge3.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
