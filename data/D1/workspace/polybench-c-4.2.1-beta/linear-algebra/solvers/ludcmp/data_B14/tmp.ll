; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = sitofp i32 %0 to double
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph47.preheader, label %._crit_edge44.thread

.lr.ph47.preheader:                               ; preds = %5
  %xtraiter111 = and i32 %0, 1
  %lcmp.mod112 = icmp eq i32 %xtraiter111, 0
  br i1 %lcmp.mod112, label %.lr.ph47.prol.loopexit, label %.lr.ph47.prol

.lr.ph47.prol:                                    ; preds = %.lr.ph47.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %8 = fdiv double 1.000000e+00, %6
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  store double %10, double* %2, align 8
  br label %.lr.ph47.prol.loopexit

.lr.ph47.prol.loopexit:                           ; preds = %.lr.ph47.preheader, %.lr.ph47.prol
  %indvars.iv108.unr = phi i64 [ 1, %.lr.ph47.prol ], [ 0, %.lr.ph47.preheader ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader14.preheader, label %.lr.ph47.preheader123

.lr.ph47.preheader123:                            ; preds = %.lr.ph47.prol.loopexit
  %wide.trip.count110.1 = zext i32 %0 to i64
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph47

.preheader15:                                     ; preds = %.lr.ph47
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.preheader14.preheader, label %._crit_edge44.thread

.preheader14.preheader:                           ; preds = %.preheader15, %.lr.ph47.prol.loopexit
  %15 = add i32 %0, -2
  %16 = zext i32 %15 to i64
  %17 = sext i32 %0 to i64
  %wide.trip.count106 = zext i32 %0 to i64
  br label %.lr.ph37

.lr.ph47:                                         ; preds = %.lr.ph47, %.lr.ph47.preheader123
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %.lr.ph47.preheader123 ], [ %indvars.iv.next109.1, %.lr.ph47 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv108
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv108
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %22 = trunc i64 %indvars.iv.next109 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv108
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %25 = trunc i64 %indvars.iv.next109.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %13
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %exitcond.1114 = icmp eq i64 %indvars.iv.next109.1, %wide.trip.count110.1
  br i1 %exitcond.1114, label %.preheader15, label %.lr.ph47

.lr.ph37:                                         ; preds = %._crit_edge42, %.preheader14.preheader
  %indvars.iv103 = phi i64 [ 0, %.preheader14.preheader ], [ %indvars.iv.next104, %._crit_edge42 ]
  %indvars.iv101 = phi i64 [ 1, %.preheader14.preheader ], [ %indvars.iv.next102, %._crit_edge42 ]
  %33 = mul nuw nsw i64 %indvars.iv103, 2001
  %34 = add nuw nsw i64 %33, 1
  %scevgep99 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %34
  %scevgep99100 = bitcast double* %scevgep99 to i8*
  %35 = sub i64 %16, %indvars.iv103
  %36 = shl i64 %35, 3
  %37 = and i64 %36, 34359738360
  %38 = add nuw nsw i64 %37, 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph37
  %indvars.iv85 = phi i64 [ 0, %.lr.ph37 ], [ %indvars.iv.next86, %._crit_edge ]
  %39 = sub nsw i64 0, %indvars.iv85
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %6
  %44 = fadd double %43, 1.000000e+00
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv85
  store double %44, double* %45, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next86, %indvars.iv101
  br i1 %exitcond93, label %._crit_edge38, label %._crit_edge

._crit_edge38:                                    ; preds = %._crit_edge
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %46 = icmp slt i64 %indvars.iv.next104, %17
  br i1 %46, label %._crit_edge42.loopexit, label %._crit_edge42

._crit_edge42.loopexit:                           ; preds = %._crit_edge38
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep99100, i8 0, i64 %38, i32 8, i1 false)
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge38, %._crit_edge42.loopexit
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103, i64 %indvars.iv103
  store double 1.000000e+00, double* %47, align 8
  %exitcond107 = icmp eq i64 %indvars.iv.next104, %wide.trip.count106
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br i1 %exitcond107, label %._crit_edge44, label %.lr.ph37

._crit_edge44.thread:                             ; preds = %.preheader15, %5
  %48 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge18

._crit_edge44:                                    ; preds = %._crit_edge42
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %50 = bitcast i8* %49 to [2000 x [2000 x double]]*
  %51 = icmp sgt i32 %0, 0
  br i1 %51, label %.preheader13.us.preheader, label %._crit_edge18

.preheader13.us.preheader:                        ; preds = %._crit_edge44
  %52 = add i32 %0, -1
  %53 = zext i32 %52 to i64
  %54 = shl nuw nsw i64 %53, 3
  %55 = add nuw nsw i64 %54, 8
  %xtraiter79 = and i32 %0, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.preheader13.us.prol.loopexit, label %._crit_edge34.us.prol.preheader

._crit_edge34.us.prol.preheader:                  ; preds = %.preheader13.us.preheader
  br label %._crit_edge34.us.prol

._crit_edge34.us.prol:                            ; preds = %._crit_edge34.us.prol.preheader, %._crit_edge34.us.prol
  %indvars.iv76.prol = phi i64 [ %indvars.iv.next77.prol, %._crit_edge34.us.prol ], [ 0, %._crit_edge34.us.prol.preheader ]
  %prol.iter82 = phi i32 [ %prol.iter82.sub, %._crit_edge34.us.prol ], [ %xtraiter79, %._crit_edge34.us.prol.preheader ]
  %56 = mul nuw nsw i64 %indvars.iv76.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %49, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1
  %prol.iter82.sub = add i32 %prol.iter82, -1
  %prol.iter82.cmp = icmp eq i32 %prol.iter82.sub, 0
  br i1 %prol.iter82.cmp, label %.preheader13.us.prol.loopexit.loopexit, label %._crit_edge34.us.prol, !llvm.loop !1

.preheader13.us.prol.loopexit.loopexit:           ; preds = %._crit_edge34.us.prol
  br label %.preheader13.us.prol.loopexit

.preheader13.us.prol.loopexit:                    ; preds = %.preheader13.us.prol.loopexit.loopexit, %.preheader13.us.preheader
  %indvars.iv76.unr = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next77.prol, %.preheader13.us.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %52, 3
  br i1 %57, label %.preheader11.lr.ph, label %._crit_edge34.us.3.preheader

._crit_edge34.us.3.preheader:                     ; preds = %.preheader13.us.prol.loopexit
  %wide.trip.count78.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count78.3, -4
  %59 = sub i64 %58, %indvars.iv76.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod125 = icmp eq i64 %61, 0
  br i1 %lcmp.mod125, label %._crit_edge34.us.3.prol.preheader, label %._crit_edge34.us.3.prol.loopexit

._crit_edge34.us.3.prol.preheader:                ; preds = %._crit_edge34.us.3.preheader
  br label %._crit_edge34.us.3.prol

._crit_edge34.us.3.prol:                          ; preds = %._crit_edge34.us.3.prol.preheader
  %62 = mul nuw nsw i64 %indvars.iv76.unr, 16000
  %scevgep.prol127 = getelementptr i8, i8* %49, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol127, i8 0, i64 %55, i32 8, i1 false)
  %63 = mul i64 %indvars.iv76.unr, 16000
  %64 = add i64 %63, 16000
  %scevgep.1.prol = getelementptr i8, i8* %49, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %55, i32 8, i1 false)
  %65 = mul i64 %indvars.iv76.unr, 16000
  %66 = add i64 %65, 32000
  %scevgep.2.prol = getelementptr i8, i8* %49, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %55, i32 8, i1 false)
  %67 = mul i64 %indvars.iv76.unr, 16000
  %68 = add i64 %67, 48000
  %scevgep.3.prol = getelementptr i8, i8* %49, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next77.3.prol = add nsw i64 %indvars.iv76.unr, 4
  br label %._crit_edge34.us.3.prol.loopexit

._crit_edge34.us.3.prol.loopexit:                 ; preds = %._crit_edge34.us.3.prol, %._crit_edge34.us.3.preheader
  %indvars.iv76.unr128 = phi i64 [ %indvars.iv76.unr, %._crit_edge34.us.3.preheader ], [ %indvars.iv.next77.3.prol, %._crit_edge34.us.3.prol ]
  %69 = icmp eq i64 %60, 0
  br i1 %69, label %.preheader12, label %._crit_edge34.us.3.preheader.new

._crit_edge34.us.3.preheader.new:                 ; preds = %._crit_edge34.us.3.prol.loopexit
  br label %._crit_edge34.us.3

.preheader12.unr-lcssa:                           ; preds = %._crit_edge34.us.3
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge34.us.3.prol.loopexit, %.preheader12.unr-lcssa
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader11.lr.ph, label %._crit_edge18

.preheader11.lr.ph:                               ; preds = %.preheader12, %.preheader13.us.prol.loopexit
  %xtraiter60 = and i32 %0, 1
  %lcmp.mod61 = icmp eq i32 %xtraiter60, 0
  %71 = icmp eq i32 %0, 1
  %wide.trip.count66 = zext i32 %0 to i64
  %wide.trip.count57.1 = zext i32 %0 to i64
  %wide.trip.count71 = zext i32 %0 to i64
  br label %.preheader10.us.us.preheader

.preheader10.us.us.preheader:                     ; preds = %._crit_edge23.us, %.preheader11.lr.ph
  %indvars.iv68 = phi i64 [ 0, %.preheader11.lr.ph ], [ %indvars.iv.next69, %._crit_edge23.us ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv68
  br label %.preheader10.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge21.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next69, %wide.trip.count71
  br i1 %exitcond72, label %.preheader9, label %.preheader10.us.us.preheader

.preheader10.us.us:                               ; preds = %._crit_edge21.us.us, %.preheader10.us.us.preheader
  %indvars.iv63 = phi i64 [ 0, %.preheader10.us.us.preheader ], [ %indvars.iv.next64, %._crit_edge21.us.us ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv68
  br i1 %lcmp.mod61, label %.prol.loopexit59, label %.prol.preheader58

.prol.preheader58:                                ; preds = %.preheader10.us.us
  %74 = load double, double* %73, align 8
  %75 = load double, double* %72, align 8
  %76 = fmul double %74, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv63, i64 0
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  br label %.prol.loopexit59

.prol.loopexit59:                                 ; preds = %.preheader10.us.us, %.prol.preheader58
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader58 ], [ 0, %.preheader10.us.us ]
  br i1 %71, label %._crit_edge21.us.us, label %.preheader10.us.us.new.preheader

.preheader10.us.us.new.preheader:                 ; preds = %.prol.loopexit59
  br label %.preheader10.us.us.new

._crit_edge21.us.us.loopexit:                     ; preds = %.preheader10.us.us.new
  br label %._crit_edge21.us.us

._crit_edge21.us.us:                              ; preds = %._crit_edge21.us.us.loopexit, %.prol.loopexit59
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next64, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge23.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us.new.preheader, %.preheader10.us.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.preheader10.us.us.new ], [ %indvars.iv55.unr.ph, %.preheader10.us.us.new.preheader ]
  %80 = load double, double* %73, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv55, i64 %indvars.iv68
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv63, i64 %indvars.iv55
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %87 = load double, double* %73, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next56, i64 %indvars.iv68
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv63, i64 %indvars.iv.next56
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count57.1
  br i1 %exitcond.1, label %._crit_edge21.us.us.loopexit, label %.preheader10.us.us.new

.preheader9:                                      ; preds = %._crit_edge23.us
  %94 = icmp sgt i32 %0, 0
  br i1 %94, label %.preheader.us.preheader, label %._crit_edge18

.preheader.us.preheader:                          ; preds = %.preheader9
  %95 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %96 = icmp ult i32 %95, 3
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.prol
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.prol
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %96, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next51, %wide.trip.count53
  br i1 %exitcond54, label %._crit_edge18.loopexit, label %.preheader.us

._crit_edge18.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.preheader9, %.preheader12, %._crit_edge44, %._crit_edge44.thread
  %122 = phi i8* [ %48, %._crit_edge44.thread ], [ %49, %._crit_edge44 ], [ %49, %.preheader12 ], [ %49, %.preheader9 ], [ %49, %._crit_edge18.loopexit ]
  tail call void @free(i8* %122) #4
  ret void

._crit_edge34.us.3:                               ; preds = %._crit_edge34.us.3, %._crit_edge34.us.3.preheader.new
  %indvars.iv76 = phi i64 [ %indvars.iv76.unr128, %._crit_edge34.us.3.preheader.new ], [ %indvars.iv.next77.3.1, %._crit_edge34.us.3 ]
  %123 = mul nuw nsw i64 %indvars.iv76, 16000
  %scevgep = getelementptr i8, i8* %49, i64 %123
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %55, i32 8, i1 false)
  %124 = mul i64 %indvars.iv76, 16000
  %125 = add i64 %124, 16000
  %scevgep.1 = getelementptr i8, i8* %49, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %55, i32 8, i1 false)
  %126 = mul i64 %indvars.iv76, 16000
  %127 = add i64 %126, 32000
  %scevgep.2 = getelementptr i8, i8* %49, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %55, i32 8, i1 false)
  %128 = mul i64 %indvars.iv76, 16000
  %129 = add i64 %128, 48000
  %scevgep.3 = getelementptr i8, i8* %49, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next77.3 = add nsw i64 %indvars.iv76, 4
  %130 = mul nuw nsw i64 %indvars.iv.next77.3, 16000
  %scevgep.1129 = getelementptr i8, i8* %49, i64 %130
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1129, i8 0, i64 %55, i32 8, i1 false)
  %131 = mul i64 %indvars.iv.next77.3, 16000
  %132 = add i64 %131, 16000
  %scevgep.1.1 = getelementptr i8, i8* %49, i64 %132
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %55, i32 8, i1 false)
  %133 = mul i64 %indvars.iv.next77.3, 16000
  %134 = add i64 %133, 32000
  %scevgep.2.1 = getelementptr i8, i8* %49, i64 %134
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %55, i32 8, i1 false)
  %135 = mul i64 %indvars.iv.next77.3, 16000
  %136 = add i64 %135, 48000
  %scevgep.3.1 = getelementptr i8, i8* %49, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next77.3.1 = add nsw i64 %indvars.iv76, 8
  %exitcond.384.1 = icmp eq i64 %indvars.iv.next77.3.1, %wide.trip.count78.3
  br i1 %exitcond.384.1, label %.preheader12.unr-lcssa, label %._crit_edge34.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader12.preheader, label %._crit_edge17

.preheader12.preheader:                           ; preds = %5
  %wide.trip.count107 = zext i32 %0 to i64
  %wide.trip.count100 = zext i32 %0 to i64
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge42, %.preheader12.preheader
  %indvars.iv104 = phi i64 [ 0, %.preheader12.preheader ], [ %indvars.iv.next105, %._crit_edge42 ]
  %7 = add i64 %indvars.iv104, 4294967295
  %8 = icmp sgt i64 %indvars.iv104, 0
  br i1 %8, label %.lr.ph33.preheader, label %._crit_edge42

.lr.ph33.preheader:                               ; preds = %.preheader12
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  br label %.lr.ph33

.preheader10:                                     ; preds = %._crit_edge42
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph25.preheader, label %._crit_edge17

.lr.ph25.preheader:                               ; preds = %.preheader10
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph25

.lr.ph41:                                         ; preds = %._crit_edge30
  %11 = icmp sgt i64 %indvars.iv104, 0
  br i1 %11, label %.lr.ph41.split.us.preheader, label %._crit_edge42

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %xtraiter91110 = and i64 %indvars.iv104, 1
  %lcmp.mod92 = icmp eq i64 %xtraiter91110, 0
  %12 = trunc i64 %7 to i32
  %13 = icmp eq i32 %12, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %._crit_edge38.us, %.lr.ph41.split.us.preheader
  %indvars.iv97 = phi i64 [ %indvars.iv104, %.lr.ph41.split.us.preheader ], [ %indvars.iv.next98, %._crit_edge38.us ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv97
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod92, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph41.split.us
  %17 = load double, double* %14, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv97
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %16, %20
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph41.split.us, %.prol.preheader
  %indvars.iv86.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph41.split.us ]
  %.135.us.unr.ph = phi double [ %21, %.prol.preheader ], [ %16, %.lr.ph41.split.us ]
  %.lcssa49.unr.ph = phi double [ %21, %.prol.preheader ], [ undef, %.lr.ph41.split.us ]
  br i1 %13, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new.preheader, %.lr.ph41.split.us.new
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %.lr.ph41.split.us.new ], [ %indvars.iv86.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %.135.us = phi double [ %35, %.lr.ph41.split.us.new ], [ %.135.us.unr.ph, %.lr.ph41.split.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv86
  %23 = bitcast double* %22 to <2 x double>*
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86, i64 %indvars.iv97
  %25 = load double, double* %24, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %26 = load <2 x double>, <2 x double>* %23, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next87, i64 %indvars.iv97
  %28 = load double, double* %27, align 8
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %26, %30
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fsub double %.135.us, %32
  %35 = fsub double %34, %33
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond.194 = icmp eq i64 %indvars.iv.next87.1, %indvars.iv104
  br i1 %exitcond.194, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit
  %.lcssa49 = phi double [ %.lcssa49.unr.ph, %.prol.loopexit ], [ %35, %._crit_edge38.us.loopexit ]
  store double %.lcssa49, double* %15, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next98, %wide.trip.count100
  br i1 %exitcond101, label %._crit_edge42.loopexit, label %.lr.ph41.split.us

.lr.ph33:                                         ; preds = %._crit_edge30, %.lr.ph33.preheader
  %indvars.iv77 = phi i64 [ 0, %.lr.ph33.preheader ], [ %indvars.iv.next78, %._crit_edge30 ]
  %36 = add i64 %indvars.iv77, 4294967295
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv77
  %38 = load double, double* %37, align 8
  %39 = icmp sgt i64 %indvars.iv77, 0
  br i1 %39, label %.lr.ph29.preheader, label %._crit_edge30

.lr.ph29.preheader:                               ; preds = %.lr.ph33
  %xtraiter72111 = and i64 %indvars.iv77, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter72111, 0
  br i1 %lcmp.mod73, label %.lr.ph29.prol.loopexit, label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.preheader
  %40 = load double, double* %9, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.preheader, %.lr.ph29.prol
  %indvars.iv67.unr.ph = phi i64 [ 1, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  %.027.unr.ph = phi double [ %44, %.lr.ph29.prol ], [ %38, %.lr.ph29.preheader ]
  %.lcssa48.unr.ph = phi double [ %44, %.lr.ph29.prol ], [ undef, %.lr.ph29.preheader ]
  %45 = trunc i64 %36 to i32
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %._crit_edge30, label %.lr.ph29.preheader130

.lr.ph29.preheader130:                            ; preds = %.lr.ph29.prol.loopexit
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader130, %.lr.ph29
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %.lr.ph29 ], [ %indvars.iv67.unr.ph, %.lr.ph29.preheader130 ]
  %.027 = phi double [ %60, %.lr.ph29 ], [ %.027.unr.ph, %.lr.ph29.preheader130 ]
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv67
  %48 = bitcast double* %47 to <2 x double>*
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv67, i64 %indvars.iv77
  %50 = load double, double* %49, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %51 = load <2 x double>, <2 x double>* %48, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next68, i64 %indvars.iv77
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fmul <2 x double> %51, %55
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  %59 = fsub double %.027, %57
  %60 = fsub double %59, %58
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next68.1, %indvars.iv77
  br i1 %exitcond.1, label %._crit_edge30.loopexit, label %.lr.ph29

._crit_edge30.loopexit:                           ; preds = %.lr.ph29
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %.lr.ph29.prol.loopexit, %.lr.ph33
  %.0.lcssa = phi double [ %38, %.lr.ph33 ], [ %.lcssa48.unr.ph, %.lr.ph29.prol.loopexit ], [ %60, %._crit_edge30.loopexit ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv77
  %62 = load double, double* %61, align 8
  %63 = fdiv double %.0.lcssa, %62
  store double %63, double* %37, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next78, %indvars.iv104
  br i1 %exitcond85, label %.lr.ph41, label %.lr.ph33

._crit_edge42.loopexit:                           ; preds = %._crit_edge38.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.lr.ph41, %.preheader12
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next105, %wide.trip.count107
  br i1 %exitcond108, label %.preheader10, label %.preheader12

.preheader:                                       ; preds = %._crit_edge22
  %64 = icmp sgt i32 %0, 0
  br i1 %64, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %.preheader
  %65 = sext i32 %0 to i64
  %66 = sext i32 %0 to i64
  br label %.lr.ph16

.lr.ph25:                                         ; preds = %._crit_edge22, %.lr.ph25.preheader
  %indvars.iv63 = phi i64 [ 0, %.lr.ph25.preheader ], [ %indvars.iv.next64, %._crit_edge22 ]
  %67 = add i64 %indvars.iv63, 4294967295
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv63
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv63, 0
  br i1 %70, label %.lr.ph21.preheader, label %._crit_edge22

.lr.ph21.preheader:                               ; preds = %.lr.ph25
  %71 = trunc i64 %indvars.iv63 to i32
  %xtraiter56 = and i32 %71, 3
  %lcmp.mod57 = icmp eq i32 %xtraiter56, 0
  br i1 %lcmp.mod57, label %.lr.ph21.prol.loopexit, label %.lr.ph21.prol.preheader

.lr.ph21.prol.preheader:                          ; preds = %.lr.ph21.preheader
  br label %.lr.ph21.prol

.lr.ph21.prol:                                    ; preds = %.lr.ph21.prol.preheader, %.lr.ph21.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph21.prol ], [ 0, %.lr.ph21.prol.preheader ]
  %.219.prol = phi double [ %77, %.lr.ph21.prol ], [ %69, %.lr.ph21.prol.preheader ]
  %prol.iter59 = phi i32 [ %prol.iter59.sub, %.lr.ph21.prol ], [ %xtraiter56, %.lr.ph21.prol.preheader ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.prol
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %.219.prol, %76
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter59.sub = add i32 %prol.iter59, -1
  %prol.iter59.cmp = icmp eq i32 %prol.iter59.sub, 0
  br i1 %prol.iter59.cmp, label %.lr.ph21.prol.loopexit.loopexit, label %.lr.ph21.prol, !llvm.loop !4

.lr.ph21.prol.loopexit.loopexit:                  ; preds = %.lr.ph21.prol
  br label %.lr.ph21.prol.loopexit

.lr.ph21.prol.loopexit:                           ; preds = %.lr.ph21.prol.loopexit.loopexit, %.lr.ph21.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph21.preheader ], [ %indvars.iv.next.prol, %.lr.ph21.prol.loopexit.loopexit ]
  %.219.unr = phi double [ %69, %.lr.ph21.preheader ], [ %77, %.lr.ph21.prol.loopexit.loopexit ]
  %.lcssa47.unr = phi double [ undef, %.lr.ph21.preheader ], [ %77, %.lr.ph21.prol.loopexit.loopexit ]
  %78 = trunc i64 %67 to i32
  %79 = icmp ult i32 %78, 3
  br i1 %79, label %._crit_edge22, label %.lr.ph21.preheader129

.lr.ph21.preheader129:                            ; preds = %.lr.ph21.prol.loopexit
  br label %.lr.ph21

.lr.ph21:                                         ; preds = %.lr.ph21.preheader129, %.lr.ph21
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph21 ], [ %indvars.iv.unr, %.lr.ph21.preheader129 ]
  %.219 = phi double [ %101, %.lr.ph21 ], [ %.219.unr, %.lr.ph21.preheader129 ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv
  %81 = bitcast double* %80 to <2 x double>*
  %82 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %81, align 8
  %85 = load <2 x double>, <2 x double>* %83, align 8
  %86 = fmul <2 x double> %84, %85
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fsub double %.219, %87
  %90 = fsub double %89, %88
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv.next.1
  %92 = bitcast double* %91 to <2 x double>*
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to <2 x double>*
  %95 = load <2 x double>, <2 x double>* %92, align 8
  %96 = load <2 x double>, <2 x double>* %94, align 8
  %97 = fmul <2 x double> %95, %96
  %98 = extractelement <2 x double> %97, i32 0
  %99 = extractelement <2 x double> %97, i32 1
  %100 = fsub double %90, %98
  %101 = fsub double %100, %99
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.360 = icmp eq i64 %indvars.iv.next.3, %indvars.iv63
  br i1 %exitcond.360, label %._crit_edge22.loopexit, label %.lr.ph21

._crit_edge22.loopexit:                           ; preds = %.lr.ph21
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %.lr.ph21.prol.loopexit, %.lr.ph25
  %.2.lcssa = phi double [ %69, %.lr.ph25 ], [ %.lcssa47.unr, %.lr.ph21.prol.loopexit ], [ %101, %._crit_edge22.loopexit ]
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv63
  store double %.2.lcssa, double* %102, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count
  br i1 %exitcond66, label %.preheader, label %.lr.ph25

.lr.ph16:                                         ; preds = %._crit_edge, %.lr.ph16.preheader
  %indvars.iv52 = phi i64 [ %65, %.lr.ph16.preheader ], [ %indvars.iv.next53, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph16.preheader ], [ %indvar.next, %._crit_edge ]
  %103 = add nsw i32 %indvar, -1
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %104 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next53
  %105 = load double, double* %104, align 8
  %106 = icmp slt i64 %indvars.iv52, %66
  br i1 %106, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph16
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph.prol ], [ %indvars.iv52, %.lr.ph.prol.preheader ]
  %.313.prol = phi double [ %112, %.lr.ph.prol ], [ %105, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50.prol
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds double, double* %3, i64 %indvars.iv50.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fsub double %.313.prol, %111
  %indvars.iv.next51.prol = add nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv50.unr = phi i64 [ %indvars.iv52, %.lr.ph.preheader ], [ %indvars.iv.next51.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.313.unr = phi double [ %105, %.lr.ph.preheader ], [ %112, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %112, %.lr.ph.prol.loopexit.loopexit ]
  %113 = icmp ult i32 %103, 3
  br i1 %113, label %._crit_edge, label %.lr.ph.preheader128

.lr.ph.preheader128:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader128, %.lr.ph
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph ], [ %indvars.iv50.unr, %.lr.ph.preheader128 ]
  %.313 = phi double [ %135, %.lr.ph ], [ %.313.unr, %.lr.ph.preheader128 ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv50
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %.313, %121
  %124 = fsub double %123, %122
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next51.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next51.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %124, %132
  %135 = fsub double %134, %133
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next51.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph16
  %.3.lcssa = phi double [ %105, %.lr.ph16 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %135, %._crit_edge.loopexit ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv.next53
  %137 = load double, double* %136, align 8
  %138 = fdiv double %.3.lcssa, %137
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  store double %138, double* %139, align 8
  %140 = icmp sgt i64 %indvars.iv52, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %140, label %.lr.ph16, label %._crit_edge17.loopexit

._crit_edge17.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader, %.preheader10, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count2 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %wide.trip.count2
  br i1 %exitcond3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
