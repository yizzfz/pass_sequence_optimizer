; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = alloca i32, align 4
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  store i32 %0, i32* %6, align 4
  store [2000 x double]* %1, [2000 x double]** %7, align 8
  %9 = sitofp i32 %0 to double
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph57, label %._crit_edge61.thread

._crit_edge61.thread:                             ; preds = %5
  br label %._crit_edge63

.lr.ph57:                                         ; preds = %5
  %11 = sext i32 %0 to i64
  %xtraiter215 = and i64 %11, 1
  %lcmp.mod216 = icmp eq i64 %xtraiter215, 0
  br i1 %lcmp.mod216, label %._crit_edge62.prol.loopexit, label %._crit_edge62.prol.preheader

._crit_edge62.prol.preheader:                     ; preds = %.lr.ph57
  br label %._crit_edge62.prol

._crit_edge62.prol:                               ; preds = %._crit_edge62.prol.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %12 = fdiv double 1.000000e+00, %9
  %13 = fmul double %12, 5.000000e-01
  %14 = fadd double %13, 4.000000e+00
  store double %14, double* %2, align 8
  br label %._crit_edge62.prol.loopexit

._crit_edge62.prol.loopexit:                      ; preds = %.lr.ph57, %._crit_edge62.prol
  %indvars.iv145.unr = phi i64 [ 0, %.lr.ph57 ], [ 1, %._crit_edge62.prol ]
  %15 = icmp eq i32 %0, 1
  br i1 %15, label %._crit_edge61, label %.lr.ph57.new

.lr.ph57.new:                                     ; preds = %._crit_edge62.prol.loopexit
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge62, %.lr.ph57.new
  %indvars.iv145 = phi i64 [ %indvars.iv145.unr, %.lr.ph57.new ], [ %indvars.iv.next146.1, %._crit_edge62 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv145
  %17 = bitcast double* %16 to <2 x double>*
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv145
  %19 = bitcast double* %18 to <2 x double>*
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %20 = trunc i64 %indvars.iv.next146 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv145
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %indvars.iv.next146.1 = add nsw i64 %indvars.iv145, 2
  %23 = trunc i64 %indvars.iv.next146.1 to i32
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %9, i32 0
  %26 = insertelement <2 x double> %25, double %9, i32 1
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = fdiv <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %22 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %33 = icmp slt i64 %indvars.iv.next146.1, %11
  br i1 %33, label %._crit_edge62, label %._crit_edge61.unr-lcssa

._crit_edge61.unr-lcssa:                          ; preds = %._crit_edge62
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge62.prol.loopexit, %._crit_edge61.unr-lcssa
  br i1 true, label %.lr.ph50, label %._crit_edge61.._crit_edge63_crit_edge

._crit_edge61.._crit_edge63_crit_edge:            ; preds = %._crit_edge61
  br label %._crit_edge63

.lr.ph50:                                         ; preds = %._crit_edge61
  %34 = add i32 %0, -2
  %35 = zext i32 %34 to i64
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge66.._crit_edge68_crit_edge, %.lr.ph50
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge66.._crit_edge68_crit_edge ], [ 0, %.lr.ph50 ]
  %indvar138 = phi i64 [ %36, %._crit_edge66.._crit_edge68_crit_edge ], [ 0, %.lr.ph50 ]
  %indvars.iv130 = phi i32 [ %indvars.iv.next131, %._crit_edge66.._crit_edge68_crit_edge ], [ 0, %.lr.ph50 ]
  %36 = add i64 %indvar138, 1
  %sext = shl i64 %36, 32
  %37 = ashr exact i64 %sext, 32
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvar138, i64 %37
  %38 = sub i64 %35, %indvar138
  %39 = shl i64 %38, 3
  %40 = and i64 %39, 34359738360
  %41 = add nuw nsw i64 %40, 8
  %42 = icmp sgt i64 %indvars.iv143, -1
  br i1 %42, label %._crit_edge65.preheader, label %._crit_edge64

._crit_edge65.preheader:                          ; preds = %._crit_edge68
  %wide.trip.count132 = zext i32 %indvars.iv130 to i64
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge65, %._crit_edge65.preheader
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge65 ], [ 0, %._crit_edge65.preheader ]
  %43 = sub nsw i64 0, %indvars.iv126
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %0
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %9
  %48 = fadd double %47, 1.000000e+00
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv143, i64 %indvars.iv126
  store double %48, double* %49, align 8
  %exitcond133 = icmp eq i64 %indvars.iv126, %wide.trip.count132
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  br i1 %exitcond133, label %._crit_edge64.loopexit, label %._crit_edge65

._crit_edge64.loopexit:                           ; preds = %._crit_edge65
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge64.loopexit, %._crit_edge68
  %indvars.iv.next144 = add i64 %indvars.iv143, 1
  %50 = icmp slt i64 %indvars.iv.next144, %11
  br i1 %50, label %._crit_edge67.._crit_edge66_crit_edge, label %._crit_edge66

._crit_edge67.._crit_edge66_crit_edge:            ; preds = %._crit_edge64
  %51 = bitcast double* %scevgep141 to i8*
  call void @llvm.memset.p0i8.i64(i8* %51, i8 0, i64 %41, i32 8, i1 false)
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge64, %._crit_edge67.._crit_edge66_crit_edge
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv143, i64 %indvars.iv143
  store double 1.000000e+00, double* %52, align 8
  br i1 %50, label %._crit_edge66.._crit_edge68_crit_edge, label %._crit_edge51

._crit_edge66.._crit_edge68_crit_edge:            ; preds = %._crit_edge66
  %indvars.iv.next131 = add i32 %indvars.iv130, 1
  br label %._crit_edge68

._crit_edge51:                                    ; preds = %._crit_edge66
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge61.._crit_edge63_crit_edge, %._crit_edge61.thread, %._crit_edge51
  %53 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %54 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %53, i8** %54, align 8
  %55 = bitcast i8* %53 to [2000 x [2000 x double]]*
  br i1 %10, label %.lr.ph33, label %._crit_edge69.thread

._crit_edge69.thread:                             ; preds = %._crit_edge63
  br label %._crit_edge73

.lr.ph33:                                         ; preds = %._crit_edge63
  %56 = sext i32 %0 to i64
  br i1 true, label %.lr.ph33..lr.ph33.split.us_crit_edge, label %.lr.ph33.split.._crit_edge34_crit_edge

.lr.ph33..lr.ph33.split.us_crit_edge:             ; preds = %.lr.ph33
  %57 = add i32 %0, -1
  %58 = zext i32 %57 to i64
  %59 = shl nuw nsw i64 %58, 3
  %60 = add nuw nsw i64 %59, 8
  %61 = add nsw i64 %56, -1
  %xtraiter212 = and i64 %56, 3
  %lcmp.mod213 = icmp eq i64 %xtraiter212, 0
  br i1 %lcmp.mod213, label %._crit_edge29.us.prol.loopexit, label %._crit_edge29.us.prol.preheader

._crit_edge29.us.prol.preheader:                  ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge
  br label %._crit_edge29.us.prol

._crit_edge29.us.prol:                            ; preds = %._crit_edge29.us.prol, %._crit_edge29.us.prol.preheader
  %indvars.iv123.prol = phi i64 [ %indvars.iv.next124.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %indvar.prol = phi i64 [ %indvar.next.prol, %._crit_edge29.us.prol ], [ 0, %._crit_edge29.us.prol.preheader ]
  %prol.iter214 = phi i64 [ %prol.iter214.sub, %._crit_edge29.us.prol ], [ %xtraiter212, %._crit_edge29.us.prol.preheader ]
  %scevgep.prol = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.prol, i64 0
  %scevgep122.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep122.prol, i8 0, i64 %60, i32 8, i1 false)
  %indvars.iv.next124.prol = add i64 %indvars.iv123.prol, 1
  %indvar.next.prol = add i64 %indvar.prol, 1
  %prol.iter214.sub = add i64 %prol.iter214, -1
  %prol.iter214.cmp = icmp eq i64 %prol.iter214.sub, 0
  br i1 %prol.iter214.cmp, label %._crit_edge29.us.prol.loopexit.unr-lcssa, label %._crit_edge29.us.prol, !llvm.loop !1

._crit_edge29.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge29.us.prol
  br label %._crit_edge29.us.prol.loopexit

._crit_edge29.us.prol.loopexit:                   ; preds = %.lr.ph33..lr.ph33.split.us_crit_edge, %._crit_edge29.us.prol.loopexit.unr-lcssa
  %indvars.iv123.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvars.iv.next124.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %indvar.unr = phi i64 [ 0, %.lr.ph33..lr.ph33.split.us_crit_edge ], [ %indvar.next.prol, %._crit_edge29.us.prol.loopexit.unr-lcssa ]
  %62 = icmp ult i64 %61, 3
  br i1 %62, label %._crit_edge29.us.._crit_edge34_crit_edge, label %.lr.ph33..lr.ph33.split.us_crit_edge.new

.lr.ph33..lr.ph33.split.us_crit_edge.new:         ; preds = %._crit_edge29.us.prol.loopexit
  br label %._crit_edge29.us

._crit_edge29.us:                                 ; preds = %._crit_edge29.us, %.lr.ph33..lr.ph33.split.us_crit_edge.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvars.iv.next124.3, %._crit_edge29.us ]
  %indvar = phi i64 [ %indvar.unr, %.lr.ph33..lr.ph33.split.us_crit_edge.new ], [ %indvar.next.3, %._crit_edge29.us ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar, i64 0
  %scevgep122 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep122, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next = add i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next, i64 0
  %scevgep122.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep122.1, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next.1 = add i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.1, i64 0
  %scevgep122.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep122.2, i8 0, i64 %60, i32 8, i1 false)
  %indvar.next.2 = add i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvar.next.2, i64 0
  %scevgep122.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep122.3, i8 0, i64 %60, i32 8, i1 false)
  %indvars.iv.next124.3 = add i64 %indvars.iv123, 4
  %63 = icmp slt i64 %indvars.iv.next124.3, %56
  %indvar.next.3 = add i64 %indvar, 4
  br i1 %63, label %._crit_edge29.us, label %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa

._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa: ; preds = %._crit_edge29.us
  br label %._crit_edge29.us.._crit_edge34_crit_edge

._crit_edge29.us.._crit_edge34_crit_edge:         ; preds = %._crit_edge29.us.prol.loopexit, %._crit_edge29.us.._crit_edge34_crit_edge.unr-lcssa
  %.pr153.pre = load i32, i32* %6, align 4
  br label %._crit_edge69

.lr.ph33.split.._crit_edge34_crit_edge:           ; preds = %.lr.ph33
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge29.us.._crit_edge34_crit_edge, %.lr.ph33.split.._crit_edge34_crit_edge
  %64 = phi i32 [ %.pr153.pre, %._crit_edge29.us.._crit_edge34_crit_edge ], [ %0, %.lr.ph33.split.._crit_edge34_crit_edge ]
  %65 = icmp sgt i32 %64, 0
  br i1 %65, label %.lr.ph20, label %._crit_edge73.thread

._crit_edge73.thread:                             ; preds = %._crit_edge69
  %.pre = load i8*, i8** %54, align 8
  br label %._crit_edge79

.lr.ph20:                                         ; preds = %._crit_edge69
  %66 = sext i32 %64 to i64
  %67 = load [2000 x double]*, [2000 x double]** %7, align 8
  %68 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %69 = bitcast [2000 x [2000 x double]]* %68 to i8*
  br i1 true, label %.lr.ph20.split.us, label %.lr.ph20.split.._crit_edge21_crit_edge

.lr.ph20.split.us:                                ; preds = %.lr.ph20
  %70 = add i32 %64, -1
  %wide.trip.count113 = zext i32 %70 to i64
  %71 = add nuw nsw i64 %wide.trip.count113, 1
  %72 = add nuw nsw i64 %wide.trip.count113, 1
  %min.iters.check = icmp ult i64 %71, 4
  %n.vec = and i64 %71, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %71, %n.vec
  br label %.lr.ph13.us

.lr.ph13.us:                                      ; preds = %._crit_edge14.us, %.lr.ph20.split.us
  %indvar159 = phi i64 [ %73, %._crit_edge14.us ], [ 0, %.lr.ph20.split.us ]
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge14.us ], [ 0, %.lr.ph20.split.us ]
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %67, i64 0, i64 %indvar159
  %73 = add i64 %indvar159, 1
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %67, i64 %wide.trip.count113, i64 %73
  br i1 true, label %.lr.ph9.us.us.preheader, label %.lr.ph13.us.._crit_edge14.us_crit_edge

.lr.ph13.us.._crit_edge14.us_crit_edge:           ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

.lr.ph9.us.us.preheader:                          ; preds = %.lr.ph13.us
  br label %.lr.ph9.us.us

._crit_edge14.us:                                 ; preds = %.lr.ph13.us.._crit_edge14.us_crit_edge, %._crit_edge10.us.us.._crit_edge14.us_crit_edge
  %indvars.iv.next118 = add i64 %indvars.iv117, 1
  %74 = icmp slt i64 %indvars.iv.next118, %66
  br i1 %74, label %.lr.ph13.us, label %._crit_edge14.us.._crit_edge21_crit_edge

._crit_edge14.us.._crit_edge21_crit_edge:         ; preds = %._crit_edge14.us
  br label %._crit_edge21

.lr.ph9.us.us:                                    ; preds = %.lr.ph9.us.us.preheader, %._crit_edge10.us.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge10.us.us ], [ 0, %.lr.ph9.us.us.preheader ]
  %scevgep155 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 0
  %scevgep157 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 %71
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv115, i64 %indvars.iv117
  br i1 %min.iters.check, label %._crit_edge76.us.us.preheader, label %min.iters.checked

._crit_edge76.us.us.preheader:                    ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph9.us.us
  %indvars.iv111.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph9.us.us ], [ %n.vec, %middle.block ]
  %76 = sub nsw i64 %72, %indvars.iv111.ph
  %xtraiter210 = and i64 %76, 1
  %lcmp.mod211 = icmp eq i64 %xtraiter210, 0
  br i1 %lcmp.mod211, label %._crit_edge76.us.us.prol.loopexit.unr-lcssa, label %._crit_edge76.us.us.prol.preheader

._crit_edge76.us.us.prol.preheader:               ; preds = %._crit_edge76.us.us.preheader
  br label %._crit_edge76.us.us.prol

._crit_edge76.us.us.prol:                         ; preds = %._crit_edge76.us.us.prol.preheader
  %77 = load double, double* %75, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv111.ph, i64 %indvars.iv117
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 %indvars.iv111.ph
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  store double %83, double* %81, align 8
  %indvars.iv.next112.prol = or i64 %indvars.iv111.ph, 1
  br label %._crit_edge76.us.us.prol.loopexit.unr-lcssa

._crit_edge76.us.us.prol.loopexit.unr-lcssa:      ; preds = %._crit_edge76.us.us.preheader, %._crit_edge76.us.us.prol
  %indvars.iv111.unr.ph = phi i64 [ %indvars.iv.next112.prol, %._crit_edge76.us.us.prol ], [ %indvars.iv111.ph, %._crit_edge76.us.us.preheader ]
  br label %._crit_edge76.us.us.prol.loopexit

._crit_edge76.us.us.prol.loopexit:                ; preds = %._crit_edge76.us.us.prol.loopexit.unr-lcssa
  %84 = icmp eq i64 %wide.trip.count113, %indvars.iv111.ph
  br i1 %84, label %._crit_edge10.us.us.loopexit, label %._crit_edge76.us.us.preheader.new

._crit_edge76.us.us.preheader.new:                ; preds = %._crit_edge76.us.us.prol.loopexit
  br label %._crit_edge76.us.us

min.iters.checked:                                ; preds = %.lr.ph9.us.us
  br i1 %cmp.zero, label %._crit_edge76.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep155, %scevgep163
  %bound1 = icmp ult double* %scevgep161, %scevgep157
  %found.conflict = and i1 %bound0, %bound1
  %bound0166 = icmp ult double* %scevgep155, %75
  %bound1167 = icmp ult double* %75, %scevgep157
  %found.conflict168 = and i1 %bound0166, %bound1167
  %conflict.rdx = or i1 %found.conflict, %found.conflict168
  br i1 %conflict.rdx, label %._crit_edge76.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %85 = or i64 %index, 1
  %86 = or i64 %index, 2
  %87 = or i64 %index, 3
  %88 = load double, double* %75, align 8, !alias.scope !3
  %89 = insertelement <2 x double> undef, double %88, i32 0
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %index, i64 %indvars.iv117
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %85, i64 %indvars.iv117
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %86, i64 %indvars.iv117
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %87, i64 %indvars.iv117
  %95 = load double, double* %91, align 8, !alias.scope !6
  %96 = load double, double* %92, align 8, !alias.scope !6
  %97 = load double, double* %93, align 8, !alias.scope !6
  %98 = load double, double* %94, align 8, !alias.scope !6
  %99 = insertelement <2 x double> undef, double %95, i32 0
  %100 = insertelement <2 x double> %99, double %96, i32 1
  %101 = insertelement <2 x double> undef, double %97, i32 0
  %102 = insertelement <2 x double> %101, double %98, i32 1
  %103 = fmul <2 x double> %90, %100
  %104 = fmul <2 x double> %90, %102
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 %index
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !8, !noalias !10
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !8, !noalias !10
  %109 = fadd <2 x double> %103, %wide.load
  %110 = fadd <2 x double> %104, %wide.load170
  store <2 x double> %109, <2 x double>* %106, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %110, <2 x double>* %108, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %111 = icmp eq i64 %index.next, %n.vec
  br i1 %111, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge10.us.us, label %._crit_edge76.us.us.preheader

._crit_edge10.us.us.loopexit.unr-lcssa:           ; preds = %._crit_edge76.us.us
  br label %._crit_edge10.us.us.loopexit

._crit_edge10.us.us.loopexit:                     ; preds = %._crit_edge76.us.us.prol.loopexit, %._crit_edge10.us.us.loopexit.unr-lcssa
  br label %._crit_edge10.us.us

._crit_edge10.us.us:                              ; preds = %._crit_edge10.us.us.loopexit, %middle.block
  %indvars.iv.next116 = add nuw i64 %indvars.iv115, 1
  %112 = icmp slt i64 %indvars.iv.next116, %66
  br i1 %112, label %.lr.ph9.us.us, label %._crit_edge10.us.us.._crit_edge14.us_crit_edge

._crit_edge10.us.us.._crit_edge14.us_crit_edge:   ; preds = %._crit_edge10.us.us
  br label %._crit_edge14.us

._crit_edge76.us.us:                              ; preds = %._crit_edge76.us.us, %._crit_edge76.us.us.preheader.new
  %indvars.iv111 = phi i64 [ %indvars.iv111.unr.ph, %._crit_edge76.us.us.preheader.new ], [ %indvars.iv.next112.1, %._crit_edge76.us.us ]
  %113 = load double, double* %75, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv111, i64 %indvars.iv117
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 %indvars.iv111
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  store double %119, double* %117, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %120 = load double, double* %75, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 %indvars.iv.next112, i64 %indvars.iv117
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv115, i64 %indvars.iv.next112
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  store double %126, double* %124, align 8
  %exitcond114.1 = icmp eq i64 %indvars.iv.next112, %wide.trip.count113
  %indvars.iv.next112.1 = add nsw i64 %indvars.iv111, 2
  br i1 %exitcond114.1, label %._crit_edge10.us.us.loopexit.unr-lcssa, label %._crit_edge76.us.us, !llvm.loop !14

.lr.ph20.split.._crit_edge21_crit_edge:           ; preds = %.lr.ph20
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %.lr.ph20.split.._crit_edge21_crit_edge, %._crit_edge14.us.._crit_edge21_crit_edge
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge69.thread, %._crit_edge21
  %127 = phi i8* [ %53, %._crit_edge69.thread ], [ %69, %._crit_edge21 ]
  %128 = phi [2000 x double]* [ %1, %._crit_edge69.thread ], [ %67, %._crit_edge21 ]
  %129 = phi [2000 x [2000 x double]]* [ %55, %._crit_edge69.thread ], [ %68, %._crit_edge21 ]
  %130 = phi i32 [ %0, %._crit_edge69.thread ], [ %64, %._crit_edge21 ]
  %131 = icmp sgt i32 %130, 0
  br i1 %131, label %.lr.ph2, label %._crit_edge79

.lr.ph2:                                          ; preds = %._crit_edge73
  %132 = sext i32 %130 to i64
  br i1 true, label %.lr.ph2..lr.ph2.split.us_crit_edge, label %.lr.ph2.split.._crit_edge3_crit_edge

.lr.ph2..lr.ph2.split.us_crit_edge:               ; preds = %.lr.ph2
  %133 = add i32 %130, -1
  %wide.trip.count107 = zext i32 %133 to i64
  %134 = add nuw nsw i64 %wide.trip.count107, 1
  %135 = and i64 %134, 8589934588
  %136 = add nsw i64 %135, -4
  %137 = lshr exact i64 %136, 2
  %138 = add nuw nsw i64 %wide.trip.count107, 1
  %min.iters.check174 = icmp ult i64 %134, 4
  %n.vec177 = and i64 %134, 8589934588
  %cmp.zero178 = icmp eq i64 %n.vec177, 0
  %139 = and i64 %137, 1
  %lcmp.mod = icmp eq i64 %139, 0
  %140 = icmp eq i64 %137, 0
  %cmp.n199 = icmp eq i64 %134, %n.vec177
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2..lr.ph2.split.us_crit_edge
  %indvar180 = phi i64 [ %indvar.next181, %._crit_edge.us ], [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ]
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge.us ], [ 0, %.lr.ph2..lr.ph2.split.us_crit_edge ]
  %scevgep182 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvar180, i64 0
  %scevgep184 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvar180, i64 %134
  %scevgep186 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvar180, i64 0
  %scevgep188 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvar180, i64 %134
  br i1 %min.iters.check174, label %._crit_edge81.us.preheader, label %min.iters.checked175

min.iters.checked175:                             ; preds = %.lr.ph2.split.us
  br i1 %cmp.zero178, label %._crit_edge81.us.preheader, label %vector.memcheck194

vector.memcheck194:                               ; preds = %min.iters.checked175
  %bound0190 = icmp ult double* %scevgep182, %scevgep188
  %bound1191 = icmp ult double* %scevgep186, %scevgep184
  %memcheck.conflict193 = and i1 %bound0190, %bound1191
  br i1 %memcheck.conflict193, label %._crit_edge81.us.preheader, label %vector.body171.preheader

vector.body171.preheader:                         ; preds = %vector.memcheck194
  br i1 %lcmp.mod, label %vector.body171.prol.preheader, label %vector.body171.prol.loopexit.unr-lcssa

vector.body171.prol.preheader:                    ; preds = %vector.body171.preheader
  br label %vector.body171.prol

vector.body171.prol:                              ; preds = %vector.body171.prol.preheader
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 0
  %142 = bitcast double* %141 to <2 x i64>*
  %wide.load204.prol = load <2 x i64>, <2 x i64>* %142, align 8, !alias.scope !15
  %143 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 2
  %144 = bitcast double* %143 to <2 x i64>*
  %wide.load205.prol = load <2 x i64>, <2 x i64>* %144, align 8, !alias.scope !15
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 0
  %146 = bitcast double* %145 to <2 x i64>*
  store <2 x i64> %wide.load204.prol, <2 x i64>* %146, align 8, !alias.scope !18, !noalias !15
  %147 = getelementptr [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 2
  %148 = bitcast double* %147 to <2 x i64>*
  store <2 x i64> %wide.load205.prol, <2 x i64>* %148, align 8, !alias.scope !18, !noalias !15
  br label %vector.body171.prol.loopexit.unr-lcssa

vector.body171.prol.loopexit.unr-lcssa:           ; preds = %vector.body171.preheader, %vector.body171.prol
  %index196.unr.ph = phi i64 [ 4, %vector.body171.prol ], [ 0, %vector.body171.preheader ]
  br label %vector.body171.prol.loopexit

vector.body171.prol.loopexit:                     ; preds = %vector.body171.prol.loopexit.unr-lcssa
  br i1 %140, label %middle.block172, label %vector.body171.preheader.new

vector.body171.preheader.new:                     ; preds = %vector.body171.prol.loopexit
  br label %vector.body171

vector.body171:                                   ; preds = %vector.body171, %vector.body171.preheader.new
  %index196 = phi i64 [ %index196.unr.ph, %vector.body171.preheader.new ], [ %index.next197.1, %vector.body171 ]
  %149 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %index196
  %150 = bitcast double* %149 to <2 x i64>*
  %wide.load204 = load <2 x i64>, <2 x i64>* %150, align 8, !alias.scope !15
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x i64>*
  %wide.load205 = load <2 x i64>, <2 x i64>* %152, align 8, !alias.scope !15
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %index196
  %154 = bitcast double* %153 to <2 x i64>*
  store <2 x i64> %wide.load204, <2 x i64>* %154, align 8, !alias.scope !18, !noalias !15
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x i64>*
  store <2 x i64> %wide.load205, <2 x i64>* %156, align 8, !alias.scope !18, !noalias !15
  %index.next197 = add i64 %index196, 4
  %157 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %index.next197
  %158 = bitcast double* %157 to <2 x i64>*
  %wide.load204.1 = load <2 x i64>, <2 x i64>* %158, align 8, !alias.scope !15
  %159 = getelementptr double, double* %157, i64 2
  %160 = bitcast double* %159 to <2 x i64>*
  %wide.load205.1 = load <2 x i64>, <2 x i64>* %160, align 8, !alias.scope !15
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %index.next197
  %162 = bitcast double* %161 to <2 x i64>*
  store <2 x i64> %wide.load204.1, <2 x i64>* %162, align 8, !alias.scope !18, !noalias !15
  %163 = getelementptr double, double* %161, i64 2
  %164 = bitcast double* %163 to <2 x i64>*
  store <2 x i64> %wide.load205.1, <2 x i64>* %164, align 8, !alias.scope !18, !noalias !15
  %index.next197.1 = add i64 %index196, 8
  %165 = icmp eq i64 %index.next197.1, %n.vec177
  br i1 %165, label %middle.block172.unr-lcssa, label %vector.body171, !llvm.loop !20

middle.block172.unr-lcssa:                        ; preds = %vector.body171
  br label %middle.block172

middle.block172:                                  ; preds = %vector.body171.prol.loopexit, %middle.block172.unr-lcssa
  br i1 %cmp.n199, label %._crit_edge.us, label %._crit_edge81.us.preheader

._crit_edge81.us.preheader:                       ; preds = %middle.block172, %vector.memcheck194, %min.iters.checked175, %.lr.ph2.split.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck194 ], [ 0, %min.iters.checked175 ], [ 0, %.lr.ph2.split.us ], [ %n.vec177, %middle.block172 ]
  %166 = sub nsw i64 %138, %indvars.iv.ph
  %167 = sub nsw i64 %wide.trip.count107, %indvars.iv.ph
  %xtraiter208 = and i64 %166, 3
  %lcmp.mod209 = icmp eq i64 %xtraiter208, 0
  br i1 %lcmp.mod209, label %._crit_edge81.us.prol.loopexit, label %._crit_edge81.us.prol.preheader

._crit_edge81.us.prol.preheader:                  ; preds = %._crit_edge81.us.preheader
  br label %._crit_edge81.us.prol

._crit_edge81.us.prol:                            ; preds = %._crit_edge81.us.prol, %._crit_edge81.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge81.us.prol ], [ %indvars.iv.ph, %._crit_edge81.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge81.us.prol ], [ %xtraiter208, %._crit_edge81.us.prol.preheader ]
  %168 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %indvars.iv.prol
  %169 = bitcast double* %168 to i64*
  %170 = load i64, i64* %169, align 8
  %171 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %indvars.iv.prol
  %172 = bitcast double* %171 to i64*
  store i64 %170, i64* %172, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge81.us.prol.loopexit.unr-lcssa, label %._crit_edge81.us.prol, !llvm.loop !21

._crit_edge81.us.prol.loopexit.unr-lcssa:         ; preds = %._crit_edge81.us.prol
  br label %._crit_edge81.us.prol.loopexit

._crit_edge81.us.prol.loopexit:                   ; preds = %._crit_edge81.us.preheader, %._crit_edge81.us.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %._crit_edge81.us.preheader ], [ %indvars.iv.next.prol, %._crit_edge81.us.prol.loopexit.unr-lcssa ]
  %173 = icmp ult i64 %167, 3
  br i1 %173, label %._crit_edge.us.loopexit, label %._crit_edge81.us.preheader.new

._crit_edge81.us.preheader.new:                   ; preds = %._crit_edge81.us.prol.loopexit
  br label %._crit_edge81.us

._crit_edge81.us:                                 ; preds = %._crit_edge81.us, %._crit_edge81.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %._crit_edge81.us.preheader.new ], [ %indvars.iv.next.3, %._crit_edge81.us ]
  %174 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %indvars.iv
  %175 = bitcast double* %174 to i64*
  %176 = load i64, i64* %175, align 8
  %177 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %indvars.iv
  %178 = bitcast double* %177 to i64*
  store i64 %176, i64* %178, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %179 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next
  %180 = bitcast double* %179 to i64*
  %181 = load i64, i64* %180, align 8
  %182 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %indvars.iv.next
  %183 = bitcast double* %182 to i64*
  store i64 %181, i64* %183, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %184 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %185 = bitcast double* %184 to i64*
  %186 = load i64, i64* %185, align 8
  %187 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %indvars.iv.next.1
  %188 = bitcast double* %187 to i64*
  store i64 %186, i64* %188, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %189 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %129, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %190 = bitcast double* %189 to i64*
  %191 = load i64, i64* %190, align 8
  %192 = getelementptr inbounds [2000 x double], [2000 x double]* %128, i64 %indvars.iv109, i64 %indvars.iv.next.2
  %193 = bitcast double* %192 to i64*
  store i64 %191, i64* %193, align 8
  %exitcond108.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count107
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond108.3, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge81.us, !llvm.loop !22

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge81.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge81.us.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block172
  %indvars.iv.next110 = add i64 %indvars.iv109, 1
  %194 = icmp slt i64 %indvars.iv.next110, %132
  %indvar.next181 = add i64 %indvar180, 1
  br i1 %194, label %.lr.ph2.split.us, label %._crit_edge.us.._crit_edge3_crit_edge

._crit_edge.us.._crit_edge3_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge3

.lr.ph2.split.._crit_edge3_crit_edge:             ; preds = %.lr.ph2
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.lr.ph2.split.._crit_edge3_crit_edge, %._crit_edge.us.._crit_edge3_crit_edge
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge73, %._crit_edge73.thread, %._crit_edge3
  %195 = phi i8* [ %127, %._crit_edge73 ], [ %.pre, %._crit_edge73.thread ], [ %127, %._crit_edge3 ]
  call void @free(i8* %195) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph56, label %._crit_edge69

.lr.ph56:                                         ; preds = %5
  %7 = add i32 %0, -1
  %8 = sext i32 %0 to i64
  %wide.trip.count128 = sext i32 %7 to i64
  %9 = add nsw i64 %wide.trip.count128, 1
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge74, %.lr.ph56
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge74 ], [ 0, %.lr.ph56 ]
  %indvars.iv137 = phi i32 [ %14, %._crit_edge74 ], [ -1, %.lr.ph56 ]
  %10 = add i64 %indvars.iv145, 4294967295
  %11 = and i64 %10, 4294967295
  %12 = sub i64 %9, %indvars.iv145
  %13 = sub i64 %wide.trip.count128, %indvars.iv145
  %14 = add i32 %indvars.iv137, 1
  %15 = icmp sgt i64 %indvars.iv145, 0
  br i1 %15, label %._crit_edge73.preheader, label %._crit_edge70

._crit_edge73.preheader:                          ; preds = %._crit_edge78
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 0
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge73.preheader, %._crit_edge71
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge71 ], [ 0, %._crit_edge73.preheader ]
  %indvars.iv118 = phi i32 [ %19, %._crit_edge71 ], [ -1, %._crit_edge73.preheader ]
  %17 = add i64 %indvars.iv122, 4294967295
  %18 = and i64 %17, 4294967295
  %19 = add i32 %indvars.iv118, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv122
  %21 = load double, double* %20, align 8
  %22 = icmp sgt i64 %indvars.iv122, 0
  br i1 %22, label %._crit_edge72.preheader, label %._crit_edge71

._crit_edge72.preheader:                          ; preds = %._crit_edge73
  %wide.trip.count120 = zext i32 %indvars.iv118 to i64
  %23 = and i64 %17, 1
  %lcmp.mod164 = icmp eq i64 %23, 0
  br i1 %lcmp.mod164, label %._crit_edge72.prol.preheader, label %._crit_edge72.prol.loopexit.unr-lcssa

._crit_edge72.prol.preheader:                     ; preds = %._crit_edge72.preheader
  br label %._crit_edge72.prol

._crit_edge72.prol:                               ; preds = %._crit_edge72.prol.preheader
  %24 = load double, double* %16, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv122
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %21, %27
  br label %._crit_edge72.prol.loopexit.unr-lcssa

._crit_edge72.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge72.preheader, %._crit_edge72.prol
  %.lcssa157.unr.ph = phi double [ %28, %._crit_edge72.prol ], [ undef, %._crit_edge72.preheader ]
  %indvars.iv112.unr.ph = phi i64 [ 1, %._crit_edge72.prol ], [ 0, %._crit_edge72.preheader ]
  %.unr165.ph = phi double [ %28, %._crit_edge72.prol ], [ %21, %._crit_edge72.preheader ]
  br label %._crit_edge72.prol.loopexit

._crit_edge72.prol.loopexit:                      ; preds = %._crit_edge72.prol.loopexit.unr-lcssa
  %29 = icmp eq i64 %18, 0
  br i1 %29, label %._crit_edge71.loopexit, label %._crit_edge72.preheader.new

._crit_edge72.preheader.new:                      ; preds = %._crit_edge72.prol.loopexit
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72, %._crit_edge72.preheader.new
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr.ph, %._crit_edge72.preheader.new ], [ %indvars.iv.next113.1, %._crit_edge72 ]
  %30 = phi double [ %.unr165.ph, %._crit_edge72.preheader.new ], [ %44, %._crit_edge72 ]
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv112
  %32 = bitcast double* %31 to <2 x double>*
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv122
  %34 = load double, double* %33, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %35 = load <2 x double>, <2 x double>* %32, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next113, i64 %indvars.iv122
  %37 = load double, double* %36, align 8
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fmul <2 x double> %35, %39
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  %43 = fsub double %30, %41
  %44 = fsub double %43, %42
  %exitcond121.1 = icmp eq i64 %indvars.iv.next113, %wide.trip.count120
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  br i1 %exitcond121.1, label %._crit_edge71.loopexit.unr-lcssa, label %._crit_edge72

._crit_edge71.loopexit.unr-lcssa:                 ; preds = %._crit_edge72
  br label %._crit_edge71.loopexit

._crit_edge71.loopexit:                           ; preds = %._crit_edge72.prol.loopexit, %._crit_edge71.loopexit.unr-lcssa
  %.lcssa157 = phi double [ %.lcssa157.unr.ph, %._crit_edge72.prol.loopexit ], [ %44, %._crit_edge71.loopexit.unr-lcssa ]
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71.loopexit, %._crit_edge73
  %.lcssa3038 = phi double [ %21, %._crit_edge73 ], [ %.lcssa157, %._crit_edge71.loopexit ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv122, i64 %indvars.iv122
  %46 = load double, double* %45, align 8
  %47 = fdiv double %.lcssa3038, %46
  store double %47, double* %20, align 8
  %indvars.iv.next123 = add nuw i64 %indvars.iv122, 1
  %48 = icmp slt i64 %indvars.iv.next123, %indvars.iv145
  br i1 %48, label %._crit_edge73, label %._crit_edge70.loopexit

._crit_edge70.loopexit:                           ; preds = %._crit_edge71
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit, %._crit_edge78
  %49 = icmp slt i64 %indvars.iv145, %8
  br i1 %49, label %.lr.ph47, label %._crit_edge74

.lr.ph47:                                         ; preds = %._crit_edge70
  br i1 %15, label %.lr.ph47.split.us.preheader, label %.lr.ph47.split.preheader

.lr.ph47.split.preheader:                         ; preds = %.lr.ph47
  %xtraiter166 = and i64 %12, 7
  %lcmp.mod167 = icmp eq i64 %xtraiter166, 0
  br i1 %lcmp.mod167, label %.lr.ph47.split.prol.loopexit, label %.lr.ph47.split.prol.preheader

.lr.ph47.split.prol.preheader:                    ; preds = %.lr.ph47.split.preheader
  br label %.lr.ph47.split.prol

.lr.ph47.split.prol:                              ; preds = %.lr.ph47.split.prol, %.lr.ph47.split.prol.preheader
  %indvars.iv126.prol = phi i64 [ %indvars.iv.next127.prol, %.lr.ph47.split.prol ], [ %indvars.iv145, %.lr.ph47.split.prol.preheader ]
  %prol.iter168 = phi i64 [ %prol.iter168.sub, %.lr.ph47.split.prol ], [ %xtraiter166, %.lr.ph47.split.prol.preheader ]
  %indvars.iv.next127.prol = add i64 %indvars.iv126.prol, 1
  %prol.iter168.sub = add i64 %prol.iter168, -1
  %prol.iter168.cmp = icmp eq i64 %prol.iter168.sub, 0
  br i1 %prol.iter168.cmp, label %.lr.ph47.split.prol.loopexit.unr-lcssa, label %.lr.ph47.split.prol, !llvm.loop !23

.lr.ph47.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph47.split.prol
  br label %.lr.ph47.split.prol.loopexit

.lr.ph47.split.prol.loopexit:                     ; preds = %.lr.ph47.split.preheader, %.lr.ph47.split.prol.loopexit.unr-lcssa
  %indvars.iv126.unr = phi i64 [ %indvars.iv145, %.lr.ph47.split.preheader ], [ %indvars.iv.next127.prol, %.lr.ph47.split.prol.loopexit.unr-lcssa ]
  %50 = icmp ult i64 %13, 7
  br i1 %50, label %.lr.ph47.split.._crit_edge74_crit_edge, label %.lr.ph47.split.preheader.new

.lr.ph47.split.preheader.new:                     ; preds = %.lr.ph47.split.prol.loopexit
  br label %.lr.ph47.split

.lr.ph47.split.us.preheader:                      ; preds = %.lr.ph47
  %wide.trip.count139 = zext i32 %indvars.iv137 to i64
  %51 = and i64 %10, 1
  %lcmp.mod170 = icmp eq i64 %51, 0
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 0
  %53 = icmp eq i64 %11, 0
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %.lr.ph47.split.us.preheader, %._crit_edge41.us
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge41.us ], [ %indvars.iv145, %.lr.ph47.split.us.preheader ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv143
  %55 = load double, double* %54, align 8
  br i1 %lcmp.mod170, label %._crit_edge76.us.prol.preheader, label %._crit_edge76.us.prol.loopexit.unr-lcssa

._crit_edge76.us.prol.preheader:                  ; preds = %.lr.ph47.split.us
  br label %._crit_edge76.us.prol

._crit_edge76.us.prol:                            ; preds = %._crit_edge76.us.prol.preheader
  %56 = load double, double* %52, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv143
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %55, %59
  br label %._crit_edge76.us.prol.loopexit.unr-lcssa

._crit_edge76.us.prol.loopexit.unr-lcssa:         ; preds = %.lr.ph47.split.us, %._crit_edge76.us.prol
  %.lcssa158.unr.ph = phi double [ %60, %._crit_edge76.us.prol ], [ undef, %.lr.ph47.split.us ]
  %indvars.iv131.unr.ph = phi i64 [ 1, %._crit_edge76.us.prol ], [ 0, %.lr.ph47.split.us ]
  %.unr171.ph = phi double [ %60, %._crit_edge76.us.prol ], [ %55, %.lr.ph47.split.us ]
  br label %._crit_edge76.us.prol.loopexit

._crit_edge76.us.prol.loopexit:                   ; preds = %._crit_edge76.us.prol.loopexit.unr-lcssa
  br i1 %53, label %._crit_edge41.us, label %.lr.ph47.split.us.new

.lr.ph47.split.us.new:                            ; preds = %._crit_edge76.us.prol.loopexit
  br label %._crit_edge76.us

._crit_edge76.us:                                 ; preds = %._crit_edge76.us, %.lr.ph47.split.us.new
  %indvars.iv131 = phi i64 [ %indvars.iv131.unr.ph, %.lr.ph47.split.us.new ], [ %indvars.iv.next132.1, %._crit_edge76.us ]
  %61 = phi double [ %.unr171.ph, %.lr.ph47.split.us.new ], [ %75, %._crit_edge76.us ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv145, i64 %indvars.iv131
  %63 = bitcast double* %62 to <2 x double>*
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv143
  %65 = load double, double* %64, align 8
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %66 = load <2 x double>, <2 x double>* %63, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next132, i64 %indvars.iv143
  %68 = load double, double* %67, align 8
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %68, i32 1
  %71 = fmul <2 x double> %66, %70
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = fsub double %61, %72
  %75 = fsub double %74, %73
  %exitcond140.1 = icmp eq i64 %indvars.iv.next132, %wide.trip.count139
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  br i1 %exitcond140.1, label %._crit_edge41.us.unr-lcssa, label %._crit_edge76.us

._crit_edge41.us.unr-lcssa:                       ; preds = %._crit_edge76.us
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge76.us.prol.loopexit, %._crit_edge41.us.unr-lcssa
  %.lcssa158 = phi double [ %.lcssa158.unr.ph, %._crit_edge76.us.prol.loopexit ], [ %75, %._crit_edge41.us.unr-lcssa ]
  store double %.lcssa158, double* %54, align 8
  %indvars.iv.next144 = add i64 %indvars.iv143, 1
  %76 = icmp slt i64 %indvars.iv.next144, %8
  br i1 %76, label %.lr.ph47.split.us, label %._crit_edge74.loopexit

.lr.ph47.split:                                   ; preds = %.lr.ph47.split, %.lr.ph47.split.preheader.new
  %indvars.iv126 = phi i64 [ %indvars.iv126.unr, %.lr.ph47.split.preheader.new ], [ %indvars.iv.next127.7, %.lr.ph47.split ]
  %indvars.iv.next127.6 = add i64 %indvars.iv126, 7
  %exitcond129.7 = icmp eq i64 %indvars.iv.next127.6, %wide.trip.count128
  %indvars.iv.next127.7 = add i64 %indvars.iv126, 8
  br i1 %exitcond129.7, label %.lr.ph47.split.._crit_edge74_crit_edge.unr-lcssa, label %.lr.ph47.split

.lr.ph47.split.._crit_edge74_crit_edge.unr-lcssa: ; preds = %.lr.ph47.split
  br label %.lr.ph47.split.._crit_edge74_crit_edge

.lr.ph47.split.._crit_edge74_crit_edge:           ; preds = %.lr.ph47.split.prol.loopexit, %.lr.ph47.split.._crit_edge74_crit_edge.unr-lcssa
  br label %._crit_edge74

._crit_edge74.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge74

._crit_edge74:                                    ; preds = %._crit_edge74.loopexit, %._crit_edge70, %.lr.ph47.split.._crit_edge74_crit_edge
  %indvars.iv.next146 = add i64 %indvars.iv145, 1
  %77 = icmp slt i64 %indvars.iv.next146, %8
  br i1 %77, label %._crit_edge78, label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge74
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %5, %._crit_edge57
  br i1 %6, label %.lr.ph18, label %._crit_edge79.thread

._crit_edge79.thread:                             ; preds = %._crit_edge69
  br label %._crit_edge83

.lr.ph18:                                         ; preds = %._crit_edge69
  %78 = sext i32 %0 to i64
  br label %._crit_edge82

._crit_edge82:                                    ; preds = %._crit_edge80, %.lr.ph18
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge80 ], [ 0, %.lr.ph18 ]
  %indvars.iv106 = phi i32 [ %indvars.iv.next107, %._crit_edge80 ], [ -1, %.lr.ph18 ]
  %79 = add i64 %indvars.iv110, 4294967295
  %80 = and i64 %79, 4294967295
  %81 = getelementptr inbounds double, double* %2, i64 %indvars.iv110
  %82 = load double, double* %81, align 8
  %83 = icmp sgt i64 %indvars.iv110, 0
  br i1 %83, label %._crit_edge81.preheader, label %._crit_edge80

._crit_edge81.preheader:                          ; preds = %._crit_edge82
  %wide.trip.count108 = zext i32 %indvars.iv106 to i64
  %xtraiter159 = and i64 %indvars.iv110, 3
  %lcmp.mod160 = icmp eq i64 %xtraiter159, 0
  br i1 %lcmp.mod160, label %._crit_edge81.prol.loopexit, label %._crit_edge81.prol.preheader

._crit_edge81.prol.preheader:                     ; preds = %._crit_edge81.preheader
  br label %._crit_edge81.prol

._crit_edge81.prol:                               ; preds = %._crit_edge81.prol, %._crit_edge81.prol.preheader
  %indvars.iv100.prol = phi i64 [ %indvars.iv.next101.prol, %._crit_edge81.prol ], [ 0, %._crit_edge81.prol.preheader ]
  %84 = phi double [ %90, %._crit_edge81.prol ], [ %82, %._crit_edge81.prol.preheader ]
  %prol.iter161 = phi i64 [ %prol.iter161.sub, %._crit_edge81.prol ], [ %xtraiter159, %._crit_edge81.prol.preheader ]
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv100.prol
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %4, i64 %indvars.iv100.prol
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fsub double %84, %89
  %indvars.iv.next101.prol = add nuw nsw i64 %indvars.iv100.prol, 1
  %prol.iter161.sub = add i64 %prol.iter161, -1
  %prol.iter161.cmp = icmp eq i64 %prol.iter161.sub, 0
  br i1 %prol.iter161.cmp, label %._crit_edge81.prol.loopexit.unr-lcssa, label %._crit_edge81.prol, !llvm.loop !24

._crit_edge81.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge81.prol
  br label %._crit_edge81.prol.loopexit

._crit_edge81.prol.loopexit:                      ; preds = %._crit_edge81.preheader, %._crit_edge81.prol.loopexit.unr-lcssa
  %.lcssa156.unr = phi double [ undef, %._crit_edge81.preheader ], [ %90, %._crit_edge81.prol.loopexit.unr-lcssa ]
  %indvars.iv100.unr = phi i64 [ 0, %._crit_edge81.preheader ], [ %indvars.iv.next101.prol, %._crit_edge81.prol.loopexit.unr-lcssa ]
  %.unr162 = phi double [ %82, %._crit_edge81.preheader ], [ %90, %._crit_edge81.prol.loopexit.unr-lcssa ]
  %91 = icmp ult i64 %80, 3
  br i1 %91, label %._crit_edge80.loopexit, label %._crit_edge81.preheader.new

._crit_edge81.preheader.new:                      ; preds = %._crit_edge81.prol.loopexit
  br label %._crit_edge81

._crit_edge81:                                    ; preds = %._crit_edge81, %._crit_edge81.preheader.new
  %indvars.iv100 = phi i64 [ %indvars.iv100.unr, %._crit_edge81.preheader.new ], [ %indvars.iv.next101.3, %._crit_edge81 ]
  %92 = phi double [ %.unr162, %._crit_edge81.preheader.new ], [ %114, %._crit_edge81 ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv100
  %94 = bitcast double* %93 to <2 x double>*
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv100
  %96 = bitcast double* %95 to <2 x double>*
  %97 = load <2 x double>, <2 x double>* %94, align 8
  %98 = load <2 x double>, <2 x double>* %96, align 8
  %99 = fmul <2 x double> %97, %98
  %100 = extractelement <2 x double> %99, i32 0
  %101 = extractelement <2 x double> %99, i32 1
  %102 = fsub double %92, %100
  %103 = fsub double %102, %101
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next101.1
  %105 = bitcast double* %104 to <2 x double>*
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next101.1
  %107 = bitcast double* %106 to <2 x double>*
  %indvars.iv.next101.2 = add nsw i64 %indvars.iv100, 3
  %108 = load <2 x double>, <2 x double>* %105, align 8
  %109 = load <2 x double>, <2 x double>* %107, align 8
  %110 = fmul <2 x double> %108, %109
  %111 = extractelement <2 x double> %110, i32 0
  %112 = extractelement <2 x double> %110, i32 1
  %113 = fsub double %103, %111
  %114 = fsub double %113, %112
  %exitcond109.3 = icmp eq i64 %indvars.iv.next101.2, %wide.trip.count108
  %indvars.iv.next101.3 = add nsw i64 %indvars.iv100, 4
  br i1 %exitcond109.3, label %._crit_edge80.loopexit.unr-lcssa, label %._crit_edge81

._crit_edge80.loopexit.unr-lcssa:                 ; preds = %._crit_edge81
  br label %._crit_edge80.loopexit

._crit_edge80.loopexit:                           ; preds = %._crit_edge81.prol.loopexit, %._crit_edge80.loopexit.unr-lcssa
  %.lcssa156 = phi double [ %.lcssa156.unr, %._crit_edge81.prol.loopexit ], [ %114, %._crit_edge80.loopexit.unr-lcssa ]
  br label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge80.loopexit, %._crit_edge82
  %.lcssa1624 = phi double [ %82, %._crit_edge82 ], [ %.lcssa156, %._crit_edge80.loopexit ]
  %115 = getelementptr inbounds double, double* %4, i64 %indvars.iv110
  store double %.lcssa1624, double* %115, align 8
  %indvars.iv.next111 = add i64 %indvars.iv110, 1
  %116 = icmp slt i64 %indvars.iv.next111, %78
  %indvars.iv.next107 = add i32 %indvars.iv106, 1
  br i1 %116, label %._crit_edge82, label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge80
  br i1 true, label %.lr.ph4, label %._crit_edge79.._crit_edge83_crit_edge

._crit_edge79.._crit_edge83_crit_edge:            ; preds = %._crit_edge79
  br label %._crit_edge83

.lr.ph4:                                          ; preds = %._crit_edge79
  %117 = add i32 %0, -1
  %118 = sext i32 %117 to i64
  %119 = add nsw i64 %118, 1
  br label %._crit_edge86

._crit_edge86:                                    ; preds = %._crit_edge84, %.lr.ph4
  %indvar = phi i32 [ %indvar.next, %._crit_edge84 ], [ 0, %.lr.ph4 ]
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge84 ], [ %118, %.lr.ph4 ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge84 ], [ %0, %.lr.ph4 ]
  %120 = sub i32 %0, %indvar
  %121 = sext i32 %120 to i64
  %122 = sub nsw i64 %118, %121
  %123 = getelementptr inbounds double, double* %4, i64 %indvars.iv98
  %124 = load double, double* %123, align 8
  %125 = add nsw i64 %indvars.iv98, 1
  %126 = icmp slt i64 %125, %78
  br i1 %126, label %.lr.ph, label %._crit_edge84

.lr.ph:                                           ; preds = %._crit_edge86
  %127 = sub nsw i64 %119, %121
  %128 = sext i32 %indvars.iv to i64
  %xtraiter = and i64 %127, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge85.prol.loopexit, label %._crit_edge85.prol.preheader

._crit_edge85.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge85.prol

._crit_edge85.prol:                               ; preds = %._crit_edge85.prol, %._crit_edge85.prol.preheader
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %._crit_edge85.prol ], [ %128, %._crit_edge85.prol.preheader ]
  %129 = phi double [ %135, %._crit_edge85.prol ], [ %124, %._crit_edge85.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge85.prol ], [ %xtraiter, %._crit_edge85.prol.preheader ]
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv96.prol
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv96.prol
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fsub double %129, %134
  %indvars.iv.next97.prol = add nsw i64 %indvars.iv96.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge85.prol.loopexit.unr-lcssa, label %._crit_edge85.prol, !llvm.loop !25

._crit_edge85.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge85.prol
  br label %._crit_edge85.prol.loopexit

._crit_edge85.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge85.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %135, %._crit_edge85.prol.loopexit.unr-lcssa ]
  %indvars.iv96.unr = phi i64 [ %128, %.lr.ph ], [ %indvars.iv.next97.prol, %._crit_edge85.prol.loopexit.unr-lcssa ]
  %.unr = phi double [ %124, %.lr.ph ], [ %135, %._crit_edge85.prol.loopexit.unr-lcssa ]
  %136 = icmp ult i64 %122, 3
  br i1 %136, label %._crit_edge84.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge85.prol.loopexit
  br label %._crit_edge85

._crit_edge85:                                    ; preds = %._crit_edge85, %.lr.ph.new
  %indvars.iv96 = phi i64 [ %indvars.iv96.unr, %.lr.ph.new ], [ %indvars.iv.next97.3, %._crit_edge85 ]
  %137 = phi double [ %.unr, %.lr.ph.new ], [ %159, %._crit_edge85 ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv96
  %139 = bitcast double* %138 to <2 x double>*
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv96
  %141 = bitcast double* %140 to <2 x double>*
  %142 = load <2 x double>, <2 x double>* %139, align 8
  %143 = load <2 x double>, <2 x double>* %141, align 8
  %144 = fmul <2 x double> %142, %143
  %145 = extractelement <2 x double> %144, i32 0
  %146 = extractelement <2 x double> %144, i32 1
  %147 = fsub double %137, %145
  %148 = fsub double %147, %146
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv.next97.1
  %150 = bitcast double* %149 to <2 x double>*
  %151 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next97.1
  %152 = bitcast double* %151 to <2 x double>*
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %153 = load <2 x double>, <2 x double>* %150, align 8
  %154 = load <2 x double>, <2 x double>* %152, align 8
  %155 = fmul <2 x double> %153, %154
  %156 = extractelement <2 x double> %155, i32 0
  %157 = extractelement <2 x double> %155, i32 1
  %158 = fsub double %148, %156
  %159 = fsub double %158, %157
  %exitcond.3 = icmp eq i64 %indvars.iv.next97.2, %118
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  br i1 %exitcond.3, label %._crit_edge84.loopexit.unr-lcssa, label %._crit_edge85

._crit_edge84.loopexit.unr-lcssa:                 ; preds = %._crit_edge85
  br label %._crit_edge84.loopexit

._crit_edge84.loopexit:                           ; preds = %._crit_edge85.prol.loopexit, %._crit_edge84.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge85.prol.loopexit ], [ %159, %._crit_edge84.loopexit.unr-lcssa ]
  br label %._crit_edge84

._crit_edge84:                                    ; preds = %._crit_edge84.loopexit, %._crit_edge86
  %.lcssa210 = phi double [ %124, %._crit_edge86 ], [ %.lcssa, %._crit_edge84.loopexit ]
  %160 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv98, i64 %indvars.iv98
  %161 = load double, double* %160, align 8
  %162 = fdiv double %.lcssa210, %161
  %163 = getelementptr inbounds double, double* %3, i64 %indvars.iv98
  store double %162, double* %163, align 8
  %indvars.iv.next99 = add i64 %indvars.iv98, -1
  %164 = icmp sgt i64 %indvars.iv98, 0
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br i1 %164, label %._crit_edge86, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge84
  br label %._crit_edge83

._crit_edge83:                                    ; preds = %._crit_edge79.._crit_edge83_crit_edge, %._crit_edge79.thread, %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, %8
  br i1 %18, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}
!25 = distinct !{!25, !2}
