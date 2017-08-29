; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2000 x double]*, double*, double*, double*) #0 {
  %6 = sitofp i32 %0 to double
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph117.preheader, label %._crit_edge114.thread

.lr.ph117.preheader:                              ; preds = %5
  %xtraiter174 = and i32 %0, 1
  %lcmp.mod175 = icmp eq i32 %xtraiter174, 0
  br i1 %lcmp.mod175, label %.lr.ph117.prol.loopexit, label %.lr.ph117.prol

.lr.ph117.prol:                                   ; preds = %.lr.ph117.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %8 = fdiv double 1.000000e+00, %6
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  store double %10, double* %2, align 8
  br label %.lr.ph117.prol.loopexit

.lr.ph117.prol.loopexit:                          ; preds = %.lr.ph117.preheader, %.lr.ph117.prol
  %indvars.iv170.unr = phi i64 [ 0, %.lr.ph117.preheader ], [ 1, %.lr.ph117.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader84.preheader, label %.lr.ph117.preheader181

.lr.ph117.preheader181:                           ; preds = %.lr.ph117.prol.loopexit
  %wide.trip.count172.1 = zext i32 %0 to i64
  br label %.lr.ph117

.preheader85:                                     ; preds = %.lr.ph117
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader84.preheader, label %._crit_edge114.thread

.preheader84.preheader:                           ; preds = %.lr.ph117.prol.loopexit, %.preheader85
  %13 = add i32 %0, -2
  %14 = zext i32 %13 to i64
  %15 = sext i32 %0 to i64
  %wide.trip.count168 = zext i32 %0 to i64
  br label %.lr.ph107

.lr.ph117:                                        ; preds = %.lr.ph117.preheader181, %.lr.ph117
  %indvars.iv170 = phi i64 [ %indvars.iv.next171.1, %.lr.ph117 ], [ %indvars.iv170.unr, %.lr.ph117.preheader181 ]
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv170
  store double 0.000000e+00, double* %16, align 8
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv170
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %18 = trunc i64 %indvars.iv.next171 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %6
  %21 = fmul double %20, 5.000000e-01
  %22 = fadd double %21, 4.000000e+00
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv170
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next171
  store double 0.000000e+00, double* %24, align 8
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next171
  store double 0.000000e+00, double* %25, align 8
  %indvars.iv.next171.1 = add nsw i64 %indvars.iv170, 2
  %26 = trunc i64 %indvars.iv.next171.1 to i32
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %6
  %29 = fmul double %28, 5.000000e-01
  %30 = fadd double %29, 4.000000e+00
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next171
  store double %30, double* %31, align 8
  %exitcond173.1 = icmp eq i64 %indvars.iv.next171.1, %wide.trip.count172.1
  br i1 %exitcond173.1, label %.preheader85, label %.lr.ph117

.lr.ph107:                                        ; preds = %.preheader84.preheader, %._crit_edge112
  %indvars.iv166 = phi i64 [ 0, %.preheader84.preheader ], [ %indvars.iv.next167, %._crit_edge112 ]
  %indvars.iv164 = phi i64 [ 1, %.preheader84.preheader ], [ %indvars.iv.next165, %._crit_edge112 ]
  %32 = mul nuw nsw i64 %indvars.iv166, 2001
  %33 = add nuw nsw i64 %32, 1
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %33
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  %34 = sub i64 %14, %indvars.iv166
  %35 = shl i64 %34, 3
  %36 = and i64 %35, 34359738360
  %37 = add nuw nsw i64 %36, 8
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph107
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %38 ], [ 0, %.lr.ph107 ]
  %39 = sub nsw i64 0, %indvars.iv150
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %6
  %44 = fadd double %43, 1.000000e+00
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv150
  store double %44, double* %45, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next151, %indvars.iv164
  br i1 %exitcond155, label %._crit_edge108, label %38

._crit_edge108:                                   ; preds = %38
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %46 = icmp slt i64 %indvars.iv.next167, %15
  br i1 %46, label %._crit_edge112.loopexit, label %._crit_edge112

._crit_edge112.loopexit:                          ; preds = %._crit_edge108
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep162163, i8 0, i64 %37, i32 8, i1 false)
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %._crit_edge108
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv166
  store double 1.000000e+00, double* %47, align 8
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next167, %wide.trip.count168
  br i1 %exitcond169, label %._crit_edge114, label %.lr.ph107

._crit_edge114.thread:                            ; preds = %.preheader85, %5
  %48 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %._crit_edge88

._crit_edge114:                                   ; preds = %._crit_edge112
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %50 = bitcast i8* %49 to [2000 x [2000 x double]]*
  %51 = icmp sgt i32 %0, 0
  br i1 %51, label %.preheader83.us.preheader, label %._crit_edge88

.preheader83.us.preheader:                        ; preds = %._crit_edge114
  %52 = add i32 %0, -1
  %53 = zext i32 %52 to i64
  %54 = shl nuw nsw i64 %53, 3
  %55 = add nuw nsw i64 %54, 8
  %xtraiter147 = and i32 %0, 3
  %lcmp.mod148 = icmp eq i32 %xtraiter147, 0
  br i1 %lcmp.mod148, label %.preheader83.us.prol.loopexit, label %._crit_edge104.us.prol.preheader

._crit_edge104.us.prol.preheader:                 ; preds = %.preheader83.us.preheader
  br label %._crit_edge104.us.prol

._crit_edge104.us.prol:                           ; preds = %._crit_edge104.us.prol.preheader, %._crit_edge104.us.prol
  %indvars.iv143.prol = phi i64 [ %indvars.iv.next144.prol, %._crit_edge104.us.prol ], [ 0, %._crit_edge104.us.prol.preheader ]
  %prol.iter149 = phi i32 [ %prol.iter149.sub, %._crit_edge104.us.prol ], [ %xtraiter147, %._crit_edge104.us.prol.preheader ]
  %56 = mul nuw nsw i64 %indvars.iv143.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %49, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next144.prol = add nuw nsw i64 %indvars.iv143.prol, 1
  %prol.iter149.sub = add i32 %prol.iter149, -1
  %prol.iter149.cmp = icmp eq i32 %prol.iter149.sub, 0
  br i1 %prol.iter149.cmp, label %.preheader83.us.prol.loopexit.loopexit, label %._crit_edge104.us.prol, !llvm.loop !1

.preheader83.us.prol.loopexit.loopexit:           ; preds = %._crit_edge104.us.prol
  br label %.preheader83.us.prol.loopexit

.preheader83.us.prol.loopexit:                    ; preds = %.preheader83.us.prol.loopexit.loopexit, %.preheader83.us.preheader
  %indvars.iv143.unr = phi i64 [ 0, %.preheader83.us.preheader ], [ %indvars.iv.next144.prol, %.preheader83.us.prol.loopexit.loopexit ]
  %57 = icmp ult i32 %52, 3
  br i1 %57, label %.preheader81.lr.ph, label %._crit_edge104.us.3.preheader

._crit_edge104.us.3.preheader:                    ; preds = %.preheader83.us.prol.loopexit
  %wide.trip.count145.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count145.3, -4
  %59 = sub i64 %58, %indvars.iv143.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod183 = icmp eq i64 %61, 0
  br i1 %lcmp.mod183, label %._crit_edge104.us.3.prol.preheader, label %._crit_edge104.us.3.prol.loopexit

._crit_edge104.us.3.prol.preheader:               ; preds = %._crit_edge104.us.3.preheader
  br label %._crit_edge104.us.3.prol

._crit_edge104.us.3.prol:                         ; preds = %._crit_edge104.us.3.prol.preheader
  %62 = mul nuw nsw i64 %indvars.iv143.unr, 16000
  %scevgep.prol185 = getelementptr i8, i8* %49, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol185, i8 0, i64 %55, i32 8, i1 false)
  %63 = mul i64 %indvars.iv143.unr, 16000
  %64 = add i64 %63, 16000
  %scevgep.1.prol = getelementptr i8, i8* %49, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %55, i32 8, i1 false)
  %65 = mul i64 %indvars.iv143.unr, 16000
  %66 = add i64 %65, 32000
  %scevgep.2.prol = getelementptr i8, i8* %49, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %55, i32 8, i1 false)
  %67 = mul i64 %indvars.iv143.unr, 16000
  %68 = add i64 %67, 48000
  %scevgep.3.prol = getelementptr i8, i8* %49, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next144.3.prol = add nsw i64 %indvars.iv143.unr, 4
  br label %._crit_edge104.us.3.prol.loopexit

._crit_edge104.us.3.prol.loopexit:                ; preds = %._crit_edge104.us.3.prol, %._crit_edge104.us.3.preheader
  %indvars.iv143.unr186 = phi i64 [ %indvars.iv143.unr, %._crit_edge104.us.3.preheader ], [ %indvars.iv.next144.3.prol, %._crit_edge104.us.3.prol ]
  %69 = icmp eq i64 %60, 0
  br i1 %69, label %.preheader82, label %._crit_edge104.us.3.preheader.new

._crit_edge104.us.3.preheader.new:                ; preds = %._crit_edge104.us.3.prol.loopexit
  br label %._crit_edge104.us.3

.preheader82.unr-lcssa:                           ; preds = %._crit_edge104.us.3
  br label %.preheader82

.preheader82:                                     ; preds = %._crit_edge104.us.3.prol.loopexit, %.preheader82.unr-lcssa
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader81.lr.ph, label %._crit_edge88

.preheader81.lr.ph:                               ; preds = %.preheader83.us.prol.loopexit, %.preheader82
  %xtraiter129 = and i32 %0, 1
  %lcmp.mod130 = icmp eq i32 %xtraiter129, 0
  %71 = icmp eq i32 %0, 1
  %wide.trip.count133 = zext i32 %0 to i64
  %wide.trip.count125.1 = zext i32 %0 to i64
  %wide.trip.count137 = zext i32 %0 to i64
  br label %.preheader80.us.us.preheader

.preheader80.us.us.preheader:                     ; preds = %.preheader81.lr.ph, %._crit_edge93.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge93.us ], [ 0, %.preheader81.lr.ph ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv135
  br label %.preheader80.us.us

._crit_edge93.us:                                 ; preds = %._crit_edge91.us.us
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, %wide.trip.count137
  br i1 %exitcond138, label %.preheader79, label %.preheader80.us.us.preheader

.preheader80.us.us:                               ; preds = %._crit_edge91.us.us, %.preheader80.us.us.preheader
  %indvars.iv131 = phi i64 [ 0, %.preheader80.us.us.preheader ], [ %indvars.iv.next132, %._crit_edge91.us.us ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv135
  br i1 %lcmp.mod130, label %.prol.loopexit128, label %.prol.preheader127

.prol.preheader127:                               ; preds = %.preheader80.us.us
  %74 = load double, double* %73, align 8
  %75 = load double, double* %72, align 8
  %76 = fmul double %74, %75
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv131, i64 0
  %78 = load double, double* %77, align 8
  %79 = fadd double %78, %76
  store double %79, double* %77, align 8
  br label %.prol.loopexit128

.prol.loopexit128:                                ; preds = %.prol.preheader127, %.preheader80.us.us
  %indvars.iv123.unr.ph = phi i64 [ 1, %.prol.preheader127 ], [ 0, %.preheader80.us.us ]
  br i1 %71, label %._crit_edge91.us.us, label %.preheader80.us.us.new.preheader

.preheader80.us.us.new.preheader:                 ; preds = %.prol.loopexit128
  br label %.preheader80.us.us.new

._crit_edge91.us.us.loopexit:                     ; preds = %.preheader80.us.us.new
  br label %._crit_edge91.us.us

._crit_edge91.us.us:                              ; preds = %._crit_edge91.us.us.loopexit, %.prol.loopexit128
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  br i1 %exitcond134, label %._crit_edge93.us, label %.preheader80.us.us

.preheader80.us.us.new:                           ; preds = %.preheader80.us.us.new.preheader, %.preheader80.us.us.new
  %indvars.iv123 = phi i64 [ %indvars.iv.next124.1, %.preheader80.us.us.new ], [ %indvars.iv123.unr.ph, %.preheader80.us.us.new.preheader ]
  %80 = load double, double* %73, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv123, i64 %indvars.iv135
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv131, i64 %indvars.iv123
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %87 = load double, double* %73, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next124, i64 %indvars.iv135
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv131, i64 %indvars.iv.next124
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %exitcond126.1 = icmp eq i64 %indvars.iv.next124.1, %wide.trip.count125.1
  br i1 %exitcond126.1, label %._crit_edge91.us.us.loopexit, label %.preheader80.us.us.new

.preheader79:                                     ; preds = %._crit_edge93.us
  %94 = icmp sgt i32 %0, 0
  br i1 %94, label %.preheader.us.preheader, label %._crit_edge88

.preheader.us.preheader:                          ; preds = %.preheader79
  %95 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %96 = icmp ult i32 %95, 3
  %wide.trip.count122 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next121, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv120, i64 %indvars.iv.prol
  %98 = bitcast double* %97 to i64*
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.prol
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
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv120, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond = icmp eq i64 %indvars.iv.next121, %wide.trip.count122
  br i1 %exitcond, label %._crit_edge88.loopexit, label %.preheader.us

._crit_edge88.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %._crit_edge114, %._crit_edge114.thread, %.preheader82, %.preheader79
  %122 = phi i8* [ %49, %.preheader79 ], [ %49, %.preheader82 ], [ %49, %._crit_edge114 ], [ %48, %._crit_edge114.thread ], [ %49, %._crit_edge88.loopexit ]
  tail call void @free(i8* %122) #5
  ret void

._crit_edge104.us.3:                              ; preds = %._crit_edge104.us.3, %._crit_edge104.us.3.preheader.new
  %indvars.iv143 = phi i64 [ %indvars.iv143.unr186, %._crit_edge104.us.3.preheader.new ], [ %indvars.iv.next144.3.1, %._crit_edge104.us.3 ]
  %123 = mul nuw nsw i64 %indvars.iv143, 16000
  %scevgep = getelementptr i8, i8* %49, i64 %123
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %55, i32 8, i1 false)
  %124 = mul i64 %indvars.iv143, 16000
  %125 = add i64 %124, 16000
  %scevgep.1 = getelementptr i8, i8* %49, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %55, i32 8, i1 false)
  %126 = mul i64 %indvars.iv143, 16000
  %127 = add i64 %126, 32000
  %scevgep.2 = getelementptr i8, i8* %49, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %55, i32 8, i1 false)
  %128 = mul i64 %indvars.iv143, 16000
  %129 = add i64 %128, 48000
  %scevgep.3 = getelementptr i8, i8* %49, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next144.3 = add nsw i64 %indvars.iv143, 4
  %130 = mul nuw nsw i64 %indvars.iv.next144.3, 16000
  %scevgep.1187 = getelementptr i8, i8* %49, i64 %130
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1187, i8 0, i64 %55, i32 8, i1 false)
  %131 = mul i64 %indvars.iv.next144.3, 16000
  %132 = add i64 %131, 16000
  %scevgep.1.1 = getelementptr i8, i8* %49, i64 %132
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %55, i32 8, i1 false)
  %133 = mul i64 %indvars.iv.next144.3, 16000
  %134 = add i64 %133, 32000
  %scevgep.2.1 = getelementptr i8, i8* %49, i64 %134
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %55, i32 8, i1 false)
  %135 = mul i64 %indvars.iv.next144.3, 16000
  %136 = add i64 %135, 48000
  %scevgep.3.1 = getelementptr i8, i8* %49, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %55, i32 8, i1 false)
  %indvars.iv.next144.3.1 = add nsw i64 %indvars.iv143, 8
  %exitcond146.3.1 = icmp eq i64 %indvars.iv.next144.3.1, %wide.trip.count145.3
  br i1 %exitcond146.3.1, label %.preheader82.unr-lcssa, label %._crit_edge104.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_ludcmp(i32, [2000 x double]*, double*, double*, double*) #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader95.preheader, label %._crit_edge100

.preheader95.preheader:                           ; preds = %5
  %wide.trip.count182 = zext i32 %0 to i64
  %wide.trip.count176 = zext i32 %0 to i64
  br label %.preheader95

.preheader95:                                     ; preds = %.preheader95.preheader, %._crit_edge125
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge125 ], [ 0, %.preheader95.preheader ]
  %7 = add i64 %indvars.iv180, 4294967295
  %8 = icmp sgt i64 %indvars.iv180, 0
  br i1 %8, label %.lr.ph116.preheader, label %._crit_edge125

.lr.ph116.preheader:                              ; preds = %.preheader95
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 0
  br label %.lr.ph116

.preheader93:                                     ; preds = %._crit_edge125
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph108.preheader, label %._crit_edge100

.lr.ph108.preheader:                              ; preds = %.preheader93
  %wide.trip.count148 = zext i32 %0 to i64
  br label %.lr.ph108

.lr.ph124:                                        ; preds = %._crit_edge113
  %11 = icmp sgt i64 %indvars.iv180, 0
  br i1 %11, label %.lr.ph124.split.us.preheader, label %._crit_edge125

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %xtraiter170184 = and i64 %indvars.iv180, 1
  %lcmp.mod171 = icmp eq i64 %xtraiter170184, 0
  %12 = trunc i64 %7 to i32
  %13 = icmp eq i32 %12, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge121.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge121.us ], [ %indvars.iv180, %.lr.ph124.split.us.preheader ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv174
  %16 = load double, double* %15, align 8
  br i1 %lcmp.mod171, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  %17 = load double, double* %14, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv174
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %16, %20
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph124.split.us
  %indvars.iv165.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph124.split.us ]
  %.1118.us.unr.ph = phi double [ %21, %.prol.preheader ], [ %16, %.lr.ph124.split.us ]
  %.lcssa132.unr.ph = phi double [ %21, %.prol.preheader ], [ undef, %.lr.ph124.split.us ]
  br i1 %13, label %._crit_edge121.us, label %.lr.ph124.split.us.new.preheader

.lr.ph124.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new.preheader, %.lr.ph124.split.us.new
  %indvars.iv165 = phi i64 [ %indvars.iv.next166.1, %.lr.ph124.split.us.new ], [ %indvars.iv165.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %.1118.us = phi double [ %33, %.lr.ph124.split.us.new ], [ %.1118.us.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv165
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv165, i64 %indvars.iv174
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %.1118.us, %26
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv.next166
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next166, i64 %indvars.iv174
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  %exitcond169.1 = icmp eq i64 %indvars.iv.next166.1, %indvars.iv180
  br i1 %exitcond169.1, label %._crit_edge121.us.loopexit, label %.lr.ph124.split.us.new

._crit_edge121.us.loopexit:                       ; preds = %.lr.ph124.split.us.new
  br label %._crit_edge121.us

._crit_edge121.us:                                ; preds = %._crit_edge121.us.loopexit, %.prol.loopexit
  %.lcssa132 = phi double [ %.lcssa132.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge121.us.loopexit ]
  store double %.lcssa132, double* %15, align 8
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, %wide.trip.count176
  br i1 %exitcond177, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph116:                                        ; preds = %.lr.ph116.preheader, %._crit_edge113
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge113 ], [ 0, %.lr.ph116.preheader ]
  %34 = add i64 %indvars.iv158, 4294967295
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv158
  %36 = load double, double* %35, align 8
  %37 = icmp sgt i64 %indvars.iv158, 0
  br i1 %37, label %.lr.ph112.preheader, label %._crit_edge113

.lr.ph112.preheader:                              ; preds = %.lr.ph116
  %xtraiter154185 = and i64 %indvars.iv158, 1
  %lcmp.mod155 = icmp eq i64 %xtraiter154185, 0
  br i1 %lcmp.mod155, label %.lr.ph112.prol.loopexit, label %.lr.ph112.prol

.lr.ph112.prol:                                   ; preds = %.lr.ph112.preheader
  %38 = load double, double* %9, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv158
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  br label %.lr.ph112.prol.loopexit

.lr.ph112.prol.loopexit:                          ; preds = %.lr.ph112.prol, %.lr.ph112.preheader
  %indvars.iv149.unr.ph = phi i64 [ 1, %.lr.ph112.prol ], [ 0, %.lr.ph112.preheader ]
  %.0110.unr.ph = phi double [ %42, %.lr.ph112.prol ], [ %36, %.lr.ph112.preheader ]
  %.lcssa131.unr.ph = phi double [ %42, %.lr.ph112.prol ], [ undef, %.lr.ph112.preheader ]
  %43 = trunc i64 %34 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %._crit_edge113, label %.lr.ph112.preheader204

.lr.ph112.preheader204:                           ; preds = %.lr.ph112.prol.loopexit
  br label %.lr.ph112

.lr.ph112:                                        ; preds = %.lr.ph112.preheader204, %.lr.ph112
  %indvars.iv149 = phi i64 [ %indvars.iv.next150.1, %.lr.ph112 ], [ %indvars.iv149.unr.ph, %.lr.ph112.preheader204 ]
  %.0110 = phi double [ %56, %.lr.ph112 ], [ %.0110.unr.ph, %.lr.ph112.preheader204 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv149
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv158
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %.0110, %49
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv180, i64 %indvars.iv.next150
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next150, i64 %indvars.iv158
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  %exitcond153.1 = icmp eq i64 %indvars.iv.next150.1, %indvars.iv158
  br i1 %exitcond153.1, label %._crit_edge113.loopexit, label %.lr.ph112

._crit_edge113.loopexit:                          ; preds = %.lr.ph112
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph112.prol.loopexit, %.lr.ph116
  %.0.lcssa = phi double [ %36, %.lr.ph116 ], [ %.lcssa131.unr.ph, %.lr.ph112.prol.loopexit ], [ %56, %._crit_edge113.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv158
  %58 = load double, double* %57, align 8
  %59 = fdiv double %.0.lcssa, %58
  store double %59, double* %35, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next159, %indvars.iv180
  br i1 %exitcond163, label %.lr.ph124, label %.lr.ph116

._crit_edge125.loopexit:                          ; preds = %._crit_edge121.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit, %.preheader95, %.lr.ph124
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %exitcond183 = icmp eq i64 %indvars.iv.next181, %wide.trip.count182
  br i1 %exitcond183, label %.preheader93, label %.preheader95

.preheader:                                       ; preds = %._crit_edge105
  %60 = icmp sgt i32 %0, 0
  br i1 %60, label %.lr.ph99.preheader, label %._crit_edge100

.lr.ph99.preheader:                               ; preds = %.preheader
  %61 = sext i32 %0 to i64
  %62 = sext i32 %0 to i64
  br label %.lr.ph99

.lr.ph108:                                        ; preds = %.lr.ph108.preheader, %._crit_edge105
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge105 ], [ 0, %.lr.ph108.preheader ]
  %63 = add i64 %indvars.iv146, 4294967295
  %64 = getelementptr inbounds double, double* %2, i64 %indvars.iv146
  %65 = load double, double* %64, align 8
  %66 = icmp sgt i64 %indvars.iv146, 0
  br i1 %66, label %.lr.ph104.preheader, label %._crit_edge105

.lr.ph104.preheader:                              ; preds = %.lr.ph108
  %67 = trunc i64 %indvars.iv146 to i32
  %xtraiter139 = and i32 %67, 3
  %lcmp.mod140 = icmp eq i32 %xtraiter139, 0
  br i1 %lcmp.mod140, label %.lr.ph104.prol.loopexit, label %.lr.ph104.prol.preheader

.lr.ph104.prol.preheader:                         ; preds = %.lr.ph104.preheader
  br label %.lr.ph104.prol

.lr.ph104.prol:                                   ; preds = %.lr.ph104.prol.preheader, %.lr.ph104.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph104.prol ], [ 0, %.lr.ph104.prol.preheader ]
  %.2102.prol = phi double [ %73, %.lr.ph104.prol ], [ %65, %.lr.ph104.prol.preheader ]
  %prol.iter142 = phi i32 [ %prol.iter142.sub, %.lr.ph104.prol ], [ %xtraiter139, %.lr.ph104.prol.preheader ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.prol
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %.2102.prol, %72
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter142.sub = add i32 %prol.iter142, -1
  %prol.iter142.cmp = icmp eq i32 %prol.iter142.sub, 0
  br i1 %prol.iter142.cmp, label %.lr.ph104.prol.loopexit.loopexit, label %.lr.ph104.prol, !llvm.loop !4

.lr.ph104.prol.loopexit.loopexit:                 ; preds = %.lr.ph104.prol
  br label %.lr.ph104.prol.loopexit

.lr.ph104.prol.loopexit:                          ; preds = %.lr.ph104.prol.loopexit.loopexit, %.lr.ph104.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph104.preheader ], [ %indvars.iv.next.prol, %.lr.ph104.prol.loopexit.loopexit ]
  %.2102.unr = phi double [ %65, %.lr.ph104.preheader ], [ %73, %.lr.ph104.prol.loopexit.loopexit ]
  %.lcssa130.unr = phi double [ undef, %.lr.ph104.preheader ], [ %73, %.lr.ph104.prol.loopexit.loopexit ]
  %74 = trunc i64 %63 to i32
  %75 = icmp ult i32 %74, 3
  br i1 %75, label %._crit_edge105, label %.lr.ph104.preheader203

.lr.ph104.preheader203:                           ; preds = %.lr.ph104.prol.loopexit
  br label %.lr.ph104

.lr.ph104:                                        ; preds = %.lr.ph104.preheader203, %.lr.ph104
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph104 ], [ %indvars.iv.unr, %.lr.ph104.preheader203 ]
  %.2102 = phi double [ %99, %.lr.ph104 ], [ %.2102.unr, %.lr.ph104.preheader203 ]
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fsub double %.2102, %80
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.next
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fsub double %81, %86
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.next.1
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fsub double %87, %92
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv146, i64 %indvars.iv.next.2
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %93, %98
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3143 = icmp eq i64 %indvars.iv.next.3, %indvars.iv146
  br i1 %exitcond.3143, label %._crit_edge105.loopexit, label %.lr.ph104

._crit_edge105.loopexit:                          ; preds = %.lr.ph104
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit, %.lr.ph104.prol.loopexit, %.lr.ph108
  %.2.lcssa = phi double [ %65, %.lr.ph108 ], [ %.lcssa130.unr, %.lr.ph104.prol.loopexit ], [ %99, %._crit_edge105.loopexit ]
  %100 = getelementptr inbounds double, double* %4, i64 %indvars.iv146
  store double %.2.lcssa, double* %100, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond = icmp eq i64 %indvars.iv.next147, %wide.trip.count148
  br i1 %exitcond, label %.preheader, label %.lr.ph108

.lr.ph99:                                         ; preds = %.lr.ph99.preheader, %._crit_edge
  %indvars.iv135 = phi i64 [ %61, %.lr.ph99.preheader ], [ %indvars.iv.next136, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph99.preheader ], [ %indvar.next, %._crit_edge ]
  %101 = add nsw i32 %indvar, -1
  %indvars.iv.next136 = add nsw i64 %indvars.iv135, -1
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next136
  %103 = load double, double* %102, align 8
  %104 = icmp slt i64 %indvars.iv135, %62
  br i1 %104, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph99
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.lr.ph.prol ], [ %indvars.iv135, %.lr.ph.prol.preheader ]
  %.396.prol = phi double [ %110, %.lr.ph.prol ], [ %103, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv133.prol
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %3, i64 %indvars.iv133.prol
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %.396.prol, %109
  %indvars.iv.next134.prol = add nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv133.unr = phi i64 [ %indvars.iv135, %.lr.ph.preheader ], [ %indvars.iv.next134.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.396.unr = phi double [ %103, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %110, %.lr.ph.prol.loopexit.loopexit ]
  %111 = icmp ult i32 %101, 3
  br i1 %111, label %._crit_edge, label %.lr.ph.preheader202

.lr.ph.preheader202:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader202, %.lr.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.3, %.lr.ph ], [ %indvars.iv133.unr, %.lr.ph.preheader202 ]
  %.396 = phi double [ %135, %.lr.ph ], [ %.396.unr, %.lr.ph.preheader202 ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv133
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv133
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %.396, %116
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134.1
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134.1
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fsub double %123, %128
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134.2
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134.2
  %133 = load double, double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fsub double %129, %134
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next134.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph99
  %.3.lcssa = phi double [ %103, %.lr.ph99 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %135, %._crit_edge.loopexit ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next136
  %137 = load double, double* %136, align 8
  %138 = fdiv double %.3.lcssa, %137
  %139 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next136
  store double %138, double* %139, align 8
  %140 = icmp sgt i64 %indvars.iv135, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %140, label %.lr.ph99, label %._crit_edge100.loopexit

._crit_edge100.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %5, %.preheader93, %.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
