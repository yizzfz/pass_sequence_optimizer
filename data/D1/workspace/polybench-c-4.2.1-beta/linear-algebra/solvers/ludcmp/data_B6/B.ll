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
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
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
  br i1 %7, label %.lr.ph119.preheader, label %._crit_edge116.thread

.lr.ph119.preheader:                              ; preds = %5
  %8 = and i32 %0, 1
  %lcmp.mod178 = icmp eq i32 %8, 0
  br i1 %lcmp.mod178, label %.lr.ph119.prol.loopexit, label %.lr.ph119.prol

.lr.ph119.prol:                                   ; preds = %.lr.ph119.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %9 = fdiv double 1.000000e+00, %6
  %10 = fmul double %9, 5.000000e-01
  %11 = fadd double %10, 4.000000e+00
  store double %11, double* %2, align 8
  br label %.lr.ph119.prol.loopexit

.lr.ph119.prol.loopexit:                          ; preds = %.lr.ph119.preheader, %.lr.ph119.prol
  %indvars.iv163.unr = phi i64 [ 0, %.lr.ph119.preheader ], [ 1, %.lr.ph119.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %.preheader86.preheader, label %.lr.ph119.preheader183

.lr.ph119.preheader183:                           ; preds = %.lr.ph119.prol.loopexit
  %wide.trip.count165.1 = zext i32 %0 to i64
  br label %.lr.ph119

.preheader87:                                     ; preds = %.lr.ph119
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader86.preheader, label %._crit_edge116.thread

.preheader86.preheader:                           ; preds = %.lr.ph119.prol.loopexit, %.preheader87
  %14 = sext i32 %0 to i64
  %15 = zext i32 %0 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nsw i64 %16, -8
  %wide.trip.count161 = zext i32 %0 to i64
  br label %.lr.ph109

.lr.ph119:                                        ; preds = %.lr.ph119.preheader183, %.lr.ph119
  %indvars.iv163 = phi i64 [ %indvars.iv.next164.1, %.lr.ph119 ], [ %indvars.iv163.unr, %.lr.ph119.preheader183 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv163
  store double 0.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv163
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %20 = trunc i64 %indvars.iv.next164 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %6
  %23 = fmul double %22, 5.000000e-01
  %24 = fadd double %23, 4.000000e+00
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv163
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next164
  store double 0.000000e+00, double* %26, align 8
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next164
  store double 0.000000e+00, double* %27, align 8
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  %28 = trunc i64 %indvars.iv.next164.1 to i32
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %6
  %31 = fmul double %30, 5.000000e-01
  %32 = fadd double %31, 4.000000e+00
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next164
  store double %32, double* %33, align 8
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164.1, %wide.trip.count165.1
  br i1 %exitcond166.1, label %.preheader87, label %.lr.ph119

.lr.ph109:                                        ; preds = %.preheader86.preheader, %._crit_edge114
  %indvars.iv159 = phi i64 [ 0, %.preheader86.preheader ], [ %indvars.iv.next160, %._crit_edge114 ]
  %indvars.iv157 = phi i64 [ 1, %.preheader86.preheader ], [ %indvars.iv.next158, %._crit_edge114 ]
  %34 = mul i64 %indvars.iv159, 2001
  %35 = add i64 %34, 1
  %scevgep175 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %35
  %scevgep175176 = bitcast double* %scevgep175 to i8*
  %36 = mul i64 %indvars.iv159, -8
  %37 = add i64 %17, %36
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph109
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %38 ], [ 0, %.lr.ph109 ]
  %39 = sub nsw i64 0, %indvars.iv145
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %6
  %44 = fadd double %43, 1.000000e+00
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv159, i64 %indvars.iv145
  store double %44, double* %45, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next146, %indvars.iv157
  br i1 %exitcond150, label %._crit_edge110, label %38

._crit_edge110:                                   ; preds = %38
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %46 = icmp slt i64 %indvars.iv.next160, %14
  br i1 %46, label %._crit_edge114.loopexit, label %._crit_edge114

._crit_edge114.loopexit:                          ; preds = %._crit_edge110
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep175176, i8 0, i64 %37, i32 8, i1 false)
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge114.loopexit, %._crit_edge110
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv159, i64 %indvars.iv159
  store double 1.000000e+00, double* %47, align 8
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next160, %wide.trip.count161
  br i1 %exitcond162, label %._crit_edge116, label %.lr.ph109

._crit_edge116.thread:                            ; preds = %.preheader87, %5
  %48 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge90

._crit_edge116:                                   ; preds = %._crit_edge114
  %49 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %50 = bitcast i8* %49 to [2000 x [2000 x double]]*
  %51 = icmp sgt i32 %0, 0
  br i1 %51, label %.preheader85.us.preheader, label %._crit_edge90

.preheader85.us.preheader:                        ; preds = %._crit_edge116
  %52 = zext i32 %0 to i64
  %53 = shl nuw nsw i64 %52, 3
  %54 = zext i32 %0 to i64
  %55 = add nsw i64 %54, -1
  %xtraiter172 = and i64 %54, 3
  %lcmp.mod173 = icmp eq i64 %xtraiter172, 0
  br i1 %lcmp.mod173, label %.preheader85.us.prol.loopexit, label %._crit_edge106.us.prol.preheader

._crit_edge106.us.prol.preheader:                 ; preds = %.preheader85.us.preheader
  br label %._crit_edge106.us.prol

._crit_edge106.us.prol:                           ; preds = %._crit_edge106.us.prol.preheader, %._crit_edge106.us.prol
  %indvars.iv141.prol = phi i64 [ %indvars.iv.next142.prol, %._crit_edge106.us.prol ], [ 0, %._crit_edge106.us.prol.preheader ]
  %prol.iter174 = phi i64 [ %prol.iter174.sub, %._crit_edge106.us.prol ], [ %xtraiter172, %._crit_edge106.us.prol.preheader ]
  %56 = mul i64 %indvars.iv141.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %49, i64 %56
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %53, i32 8, i1 false)
  %indvars.iv.next142.prol = add nuw nsw i64 %indvars.iv141.prol, 1
  %prol.iter174.sub = add i64 %prol.iter174, -1
  %prol.iter174.cmp = icmp eq i64 %prol.iter174.sub, 0
  br i1 %prol.iter174.cmp, label %.preheader85.us.prol.loopexit.loopexit, label %._crit_edge106.us.prol, !llvm.loop !1

.preheader85.us.prol.loopexit.loopexit:           ; preds = %._crit_edge106.us.prol
  br label %.preheader85.us.prol.loopexit

.preheader85.us.prol.loopexit:                    ; preds = %.preheader85.us.prol.loopexit.loopexit, %.preheader85.us.preheader
  %indvars.iv141.unr = phi i64 [ 0, %.preheader85.us.preheader ], [ %indvars.iv.next142.prol, %.preheader85.us.prol.loopexit.loopexit ]
  %57 = icmp ult i64 %55, 3
  br i1 %57, label %.preheader84, label %._crit_edge106.us.3.preheader

._crit_edge106.us.3.preheader:                    ; preds = %.preheader85.us.prol.loopexit
  %wide.trip.count143.3 = zext i32 %0 to i64
  %58 = add nsw i64 %wide.trip.count143.3, -4
  %59 = sub i64 %58, %indvars.iv141.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod185 = icmp eq i64 %61, 0
  br i1 %lcmp.mod185, label %._crit_edge106.us.3.prol.preheader, label %._crit_edge106.us.3.prol.loopexit

._crit_edge106.us.3.prol.preheader:               ; preds = %._crit_edge106.us.3.preheader
  br label %._crit_edge106.us.3.prol

._crit_edge106.us.3.prol:                         ; preds = %._crit_edge106.us.3.prol.preheader
  %62 = mul i64 %indvars.iv141.unr, 16000
  %scevgep.prol187 = getelementptr i8, i8* %49, i64 %62
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol187, i8 0, i64 %53, i32 8, i1 false)
  %63 = mul i64 %indvars.iv141.unr, 16000
  %64 = add i64 %63, 16000
  %scevgep.1.prol = getelementptr i8, i8* %49, i64 %64
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %53, i32 8, i1 false)
  %65 = mul i64 %indvars.iv141.unr, 16000
  %66 = add i64 %65, 32000
  %scevgep.2.prol = getelementptr i8, i8* %49, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %53, i32 8, i1 false)
  %67 = mul i64 %indvars.iv141.unr, 16000
  %68 = add i64 %67, 48000
  %scevgep.3.prol = getelementptr i8, i8* %49, i64 %68
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %53, i32 8, i1 false)
  %indvars.iv.next142.3.prol = add nsw i64 %indvars.iv141.unr, 4
  br label %._crit_edge106.us.3.prol.loopexit

._crit_edge106.us.3.prol.loopexit:                ; preds = %._crit_edge106.us.3.prol, %._crit_edge106.us.3.preheader
  %indvars.iv141.unr188 = phi i64 [ %indvars.iv141.unr, %._crit_edge106.us.3.preheader ], [ %indvars.iv.next142.3.prol, %._crit_edge106.us.3.prol ]
  %69 = icmp eq i64 %60, 0
  br i1 %69, label %.preheader84.loopexit, label %._crit_edge106.us.3.preheader.new

._crit_edge106.us.3.preheader.new:                ; preds = %._crit_edge106.us.3.prol.loopexit
  br label %._crit_edge106.us.3

.preheader84.loopexit.unr-lcssa:                  ; preds = %._crit_edge106.us.3
  br label %.preheader84.loopexit

.preheader84.loopexit:                            ; preds = %._crit_edge106.us.3.prol.loopexit, %.preheader84.loopexit.unr-lcssa
  br label %.preheader84

.preheader84:                                     ; preds = %.preheader84.loopexit, %.preheader85.us.prol.loopexit
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader82.us.us.preheader.preheader, label %._crit_edge90

.preheader82.us.us.preheader.preheader:           ; preds = %.preheader84
  %71 = and i32 %0, 1
  %lcmp.mod171 = icmp eq i32 %71, 0
  %72 = icmp eq i32 %0, 1
  %wide.trip.count131 = zext i32 %0 to i64
  %wide.trip.count127.1 = zext i32 %0 to i64
  %wide.trip.count135 = zext i32 %0 to i64
  br label %.preheader82.us.us.preheader

.preheader82.us.us.preheader:                     ; preds = %.preheader82.us.us.preheader.preheader, %._crit_edge95.us
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge95.us ], [ 0, %.preheader82.us.us.preheader.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv133
  br label %.preheader82.us.us

._crit_edge95.us:                                 ; preds = %._crit_edge93.us.us
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, %wide.trip.count135
  br i1 %exitcond136, label %.preheader81, label %.preheader82.us.us.preheader

.preheader82.us.us:                               ; preds = %._crit_edge93.us.us, %.preheader82.us.us.preheader
  %indvars.iv129 = phi i64 [ 0, %.preheader82.us.us.preheader ], [ %indvars.iv.next130, %._crit_edge93.us.us ]
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv129, i64 %indvars.iv133
  br i1 %lcmp.mod171, label %.prol.loopexit169, label %.prol.preheader168

.prol.preheader168:                               ; preds = %.preheader82.us.us
  %75 = load double, double* %74, align 8
  %76 = load double, double* %73, align 8
  %77 = fmul double %75, %76
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv129, i64 0
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  br label %.prol.loopexit169

.prol.loopexit169:                                ; preds = %.prol.preheader168, %.preheader82.us.us
  %indvars.iv125.unr.ph = phi i64 [ 1, %.prol.preheader168 ], [ 0, %.preheader82.us.us ]
  br i1 %72, label %._crit_edge93.us.us, label %.preheader82.us.us.new.preheader

.preheader82.us.us.new.preheader:                 ; preds = %.prol.loopexit169
  br label %.preheader82.us.us.new

._crit_edge93.us.us.loopexit:                     ; preds = %.preheader82.us.us.new
  br label %._crit_edge93.us.us

._crit_edge93.us.us:                              ; preds = %._crit_edge93.us.us.loopexit, %.prol.loopexit169
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, %wide.trip.count131
  br i1 %exitcond132, label %._crit_edge95.us, label %.preheader82.us.us

.preheader82.us.us.new:                           ; preds = %.preheader82.us.us.new.preheader, %.preheader82.us.us.new
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %.preheader82.us.us.new ], [ %indvars.iv125.unr.ph, %.preheader82.us.us.new.preheader ]
  %81 = load double, double* %74, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv133
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv129, i64 %indvars.iv125
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %88 = load double, double* %74, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next126, i64 %indvars.iv133
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv129, i64 %indvars.iv.next126
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond128.1 = icmp eq i64 %indvars.iv.next126.1, %wide.trip.count127.1
  br i1 %exitcond128.1, label %._crit_edge93.us.us.loopexit, label %.preheader82.us.us.new

.preheader81:                                     ; preds = %._crit_edge95.us
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.preheader.us.preheader, label %._crit_edge90

.preheader.us.preheader:                          ; preds = %.preheader81
  %96 = zext i32 %0 to i64
  %97 = add nsw i64 %96, -1
  %xtraiter = and i64 %96, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %98 = icmp ult i64 %97, 3
  %wide.trip.count123 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv121 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next122, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv121, i64 %indvars.iv.prol
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.prol
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %98, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv121, i64 %indvars.iv
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv121, i64 %indvars.iv.next
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv121, i64 %indvars.iv.next.1
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next.1
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv121, i64 %indvars.iv.next.2
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv121, i64 %indvars.iv.next.2
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next122, %wide.trip.count123
  br i1 %exitcond124, label %._crit_edge90.loopexit, label %.preheader.us

._crit_edge90.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90.loopexit, %._crit_edge116, %._crit_edge116.thread, %.preheader84, %.preheader81
  %124 = phi i8* [ %49, %.preheader81 ], [ %49, %.preheader84 ], [ %49, %._crit_edge116 ], [ %48, %._crit_edge116.thread ], [ %49, %._crit_edge90.loopexit ]
  tail call void @free(i8* %124) #4
  ret void

._crit_edge106.us.3:                              ; preds = %._crit_edge106.us.3, %._crit_edge106.us.3.preheader.new
  %indvars.iv141 = phi i64 [ %indvars.iv141.unr188, %._crit_edge106.us.3.preheader.new ], [ %indvars.iv.next142.3.1, %._crit_edge106.us.3 ]
  %125 = mul i64 %indvars.iv141, 16000
  %scevgep = getelementptr i8, i8* %49, i64 %125
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %53, i32 8, i1 false)
  %126 = mul i64 %indvars.iv141, 16000
  %127 = add i64 %126, 16000
  %scevgep.1 = getelementptr i8, i8* %49, i64 %127
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %53, i32 8, i1 false)
  %128 = mul i64 %indvars.iv141, 16000
  %129 = add i64 %128, 32000
  %scevgep.2 = getelementptr i8, i8* %49, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %53, i32 8, i1 false)
  %130 = mul i64 %indvars.iv141, 16000
  %131 = add i64 %130, 48000
  %scevgep.3 = getelementptr i8, i8* %49, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %53, i32 8, i1 false)
  %indvars.iv.next142.3 = add nsw i64 %indvars.iv141, 4
  %132 = mul i64 %indvars.iv.next142.3, 16000
  %scevgep.1189 = getelementptr i8, i8* %49, i64 %132
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1189, i8 0, i64 %53, i32 8, i1 false)
  %133 = mul i64 %indvars.iv.next142.3, 16000
  %134 = add i64 %133, 16000
  %scevgep.1.1 = getelementptr i8, i8* %49, i64 %134
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %53, i32 8, i1 false)
  %135 = mul i64 %indvars.iv.next142.3, 16000
  %136 = add i64 %135, 32000
  %scevgep.2.1 = getelementptr i8, i8* %49, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %53, i32 8, i1 false)
  %137 = mul i64 %indvars.iv.next142.3, 16000
  %138 = add i64 %137, 48000
  %scevgep.3.1 = getelementptr i8, i8* %49, i64 %138
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %53, i32 8, i1 false)
  %indvars.iv.next142.3.1 = add nsw i64 %indvars.iv141, 8
  %exitcond144.3.1 = icmp eq i64 %indvars.iv.next142.3.1, %wide.trip.count143.3
  br i1 %exitcond144.3.1, label %.preheader84.loopexit.unr-lcssa, label %._crit_edge106.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader95.preheader, label %._crit_edge100

.preheader95.preheader:                           ; preds = %5
  %wide.trip.count169 = zext i32 %0 to i64
  %wide.trip.count165 = zext i32 %0 to i64
  br label %.preheader95

.preheader95:                                     ; preds = %.preheader95.preheader, %._crit_edge125
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge125 ], [ 0, %.preheader95.preheader ]
  %7 = icmp sgt i64 %indvars.iv167, 0
  br i1 %7, label %.lr.ph116.preheader, label %._crit_edge125

.lr.ph116.preheader:                              ; preds = %.preheader95
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 0
  br label %.lr.ph116

.preheader93:                                     ; preds = %._crit_edge125
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph108.preheader, label %._crit_edge100

.lr.ph108.preheader:                              ; preds = %.preheader93
  %wide.trip.count142 = zext i32 %0 to i64
  br label %.lr.ph108

.lr.ph124:                                        ; preds = %._crit_edge113
  %10 = icmp sgt i64 %indvars.iv167, 0
  br i1 %10, label %.lr.ph124.split.us.preheader, label %._crit_edge125

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %xtraiter176 = and i64 %indvars.iv167, 1
  %lcmp.mod177 = icmp eq i64 %xtraiter176, 0
  %11 = icmp eq i64 %indvars.iv167, 1
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge121.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %._crit_edge121.us ], [ %indvars.iv167, %.lr.ph124.split.us.preheader ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv163
  %14 = load double, double* %13, align 8
  br i1 %lcmp.mod177, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  %15 = load double, double* %12, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv163
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %14, %18
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph124.split.us
  %indvars.iv156.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph124.split.us ]
  %.1118.us.unr.ph = phi double [ %19, %.prol.preheader ], [ %14, %.lr.ph124.split.us ]
  %.lcssa132.unr.ph = phi double [ %19, %.prol.preheader ], [ undef, %.lr.ph124.split.us ]
  br i1 %11, label %._crit_edge121.us, label %.lr.ph124.split.us.new.preheader

.lr.ph124.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new.preheader, %.lr.ph124.split.us.new
  %indvars.iv156 = phi i64 [ %indvars.iv.next157.1, %.lr.ph124.split.us.new ], [ %indvars.iv156.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %.1118.us = phi double [ %31, %.lr.ph124.split.us.new ], [ %.1118.us.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv156
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv156, i64 %indvars.iv163
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %.1118.us, %24
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv.next157
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next157, i64 %indvars.iv163
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %exitcond160.1 = icmp eq i64 %indvars.iv.next157.1, %indvars.iv167
  br i1 %exitcond160.1, label %._crit_edge121.us.loopexit, label %.lr.ph124.split.us.new

._crit_edge121.us.loopexit:                       ; preds = %.lr.ph124.split.us.new
  br label %._crit_edge121.us

._crit_edge121.us:                                ; preds = %._crit_edge121.us.loopexit, %.prol.loopexit
  %.lcssa132 = phi double [ %.lcssa132.unr.ph, %.prol.loopexit ], [ %31, %._crit_edge121.us.loopexit ]
  store double %.lcssa132, double* %13, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %wide.trip.count165
  br i1 %exitcond166, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph116:                                        ; preds = %.lr.ph116.preheader, %._crit_edge113
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge113 ], [ 0, %.lr.ph116.preheader ]
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv149
  %33 = load double, double* %32, align 8
  %34 = icmp sgt i64 %indvars.iv149, 0
  br i1 %34, label %.lr.ph112.preheader, label %._crit_edge113

.lr.ph112.preheader:                              ; preds = %.lr.ph116
  %xtraiter174 = and i64 %indvars.iv149, 1
  %lcmp.mod175 = icmp eq i64 %xtraiter174, 0
  br i1 %lcmp.mod175, label %.lr.ph112.prol.loopexit, label %.lr.ph112.prol

.lr.ph112.prol:                                   ; preds = %.lr.ph112.preheader
  %35 = load double, double* %8, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv149
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %33, %38
  br label %.lr.ph112.prol.loopexit

.lr.ph112.prol.loopexit:                          ; preds = %.lr.ph112.prol, %.lr.ph112.preheader
  %indvars.iv144.unr.ph = phi i64 [ 1, %.lr.ph112.prol ], [ 0, %.lr.ph112.preheader ]
  %.0110.unr.ph = phi double [ %39, %.lr.ph112.prol ], [ %33, %.lr.ph112.preheader ]
  %.lcssa131.unr.ph = phi double [ %39, %.lr.ph112.prol ], [ undef, %.lr.ph112.preheader ]
  %40 = icmp eq i64 %indvars.iv149, 1
  br i1 %40, label %._crit_edge113, label %.lr.ph112.preheader196

.lr.ph112.preheader196:                           ; preds = %.lr.ph112.prol.loopexit
  br label %.lr.ph112

.lr.ph112:                                        ; preds = %.lr.ph112.preheader196, %.lr.ph112
  %indvars.iv144 = phi i64 [ %indvars.iv.next145.1, %.lr.ph112 ], [ %indvars.iv144.unr.ph, %.lr.ph112.preheader196 ]
  %.0110 = phi double [ %52, %.lr.ph112 ], [ %.0110.unr.ph, %.lr.ph112.preheader196 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv144
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv149
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fsub double %.0110, %45
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv.next145
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next145, i64 %indvars.iv149
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %46, %51
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  %exitcond148.1 = icmp eq i64 %indvars.iv.next145.1, %indvars.iv149
  br i1 %exitcond148.1, label %._crit_edge113.loopexit, label %.lr.ph112

._crit_edge113.loopexit:                          ; preds = %.lr.ph112
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph112.prol.loopexit, %.lr.ph116
  %.0.lcssa = phi double [ %33, %.lr.ph116 ], [ %.lcssa131.unr.ph, %.lr.ph112.prol.loopexit ], [ %52, %._crit_edge113.loopexit ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv149
  %54 = load double, double* %53, align 8
  %55 = fdiv double %.0.lcssa, %54
  store double %55, double* %32, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next150, %indvars.iv167
  br i1 %exitcond154, label %.lr.ph124, label %.lr.ph116

._crit_edge125.loopexit:                          ; preds = %._crit_edge121.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit, %.preheader95, %.lr.ph124
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond170 = icmp eq i64 %indvars.iv.next168, %wide.trip.count169
  br i1 %exitcond170, label %.preheader93, label %.preheader95

.preheader:                                       ; preds = %._crit_edge105
  %56 = icmp sgt i32 %0, 0
  br i1 %56, label %.lr.ph99.preheader, label %._crit_edge100

.lr.ph99.preheader:                               ; preds = %.preheader
  %57 = sext i32 %0 to i64
  %58 = sext i32 %0 to i64
  br label %.lr.ph99

.lr.ph108:                                        ; preds = %.lr.ph108.preheader, %._crit_edge105
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge105 ], [ 0, %.lr.ph108.preheader ]
  %59 = add i64 %indvars.iv140, -1
  %60 = getelementptr inbounds double, double* %2, i64 %indvars.iv140
  %61 = load double, double* %60, align 8
  %62 = icmp sgt i64 %indvars.iv140, 0
  br i1 %62, label %.lr.ph104.preheader, label %._crit_edge105

.lr.ph104.preheader:                              ; preds = %.lr.ph108
  %xtraiter171 = and i64 %indvars.iv140, 3
  %lcmp.mod172 = icmp eq i64 %xtraiter171, 0
  br i1 %lcmp.mod172, label %.lr.ph104.prol.loopexit, label %.lr.ph104.prol.preheader

.lr.ph104.prol.preheader:                         ; preds = %.lr.ph104.preheader
  br label %.lr.ph104.prol

.lr.ph104.prol:                                   ; preds = %.lr.ph104.prol.preheader, %.lr.ph104.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph104.prol ], [ 0, %.lr.ph104.prol.preheader ]
  %.2102.prol = phi double [ %68, %.lr.ph104.prol ], [ %61, %.lr.ph104.prol.preheader ]
  %prol.iter173 = phi i64 [ %prol.iter173.sub, %.lr.ph104.prol ], [ %xtraiter171, %.lr.ph104.prol.preheader ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv.prol
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %.2102.prol, %67
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter173.sub = add i64 %prol.iter173, -1
  %prol.iter173.cmp = icmp eq i64 %prol.iter173.sub, 0
  br i1 %prol.iter173.cmp, label %.lr.ph104.prol.loopexit.loopexit, label %.lr.ph104.prol, !llvm.loop !4

.lr.ph104.prol.loopexit.loopexit:                 ; preds = %.lr.ph104.prol
  br label %.lr.ph104.prol.loopexit

.lr.ph104.prol.loopexit:                          ; preds = %.lr.ph104.prol.loopexit.loopexit, %.lr.ph104.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph104.preheader ], [ %indvars.iv.next.prol, %.lr.ph104.prol.loopexit.loopexit ]
  %.2102.unr = phi double [ %61, %.lr.ph104.preheader ], [ %68, %.lr.ph104.prol.loopexit.loopexit ]
  %.lcssa130.unr = phi double [ undef, %.lr.ph104.preheader ], [ %68, %.lr.ph104.prol.loopexit.loopexit ]
  %69 = icmp ult i64 %59, 3
  br i1 %69, label %._crit_edge105, label %.lr.ph104.preheader195

.lr.ph104.preheader195:                           ; preds = %.lr.ph104.prol.loopexit
  br label %.lr.ph104

.lr.ph104:                                        ; preds = %.lr.ph104.preheader195, %.lr.ph104
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph104 ], [ %indvars.iv.unr, %.lr.ph104.preheader195 ]
  %.2102 = phi double [ %93, %.lr.ph104 ], [ %.2102.unr, %.lr.ph104.preheader195 ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %.2102, %74
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fsub double %75, %80
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv.next.1
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fsub double %81, %86
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv140, i64 %indvars.iv.next.2
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fsub double %87, %92
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond139.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv140
  br i1 %exitcond139.3, label %._crit_edge105.loopexit, label %.lr.ph104

._crit_edge105.loopexit:                          ; preds = %.lr.ph104
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit, %.lr.ph104.prol.loopexit, %.lr.ph108
  %.2.lcssa = phi double [ %61, %.lr.ph108 ], [ %.lcssa130.unr, %.lr.ph104.prol.loopexit ], [ %93, %._crit_edge105.loopexit ]
  %94 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  store double %.2.lcssa, double* %94, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, %wide.trip.count142
  br i1 %exitcond143, label %.preheader, label %.lr.ph108

.lr.ph99:                                         ; preds = %.lr.ph99.preheader, %._crit_edge
  %indvar = phi i32 [ 0, %.lr.ph99.preheader ], [ %indvar.next, %._crit_edge ]
  %indvars.iv135 = phi i64 [ %57, %.lr.ph99.preheader ], [ %indvars.iv.next136, %._crit_edge ]
  %95 = add i32 %indvar, -1
  %indvars.iv.next136 = add nsw i64 %indvars.iv135, -1
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next136
  %97 = load double, double* %96, align 8
  %98 = icmp slt i64 %indvars.iv135, %58
  br i1 %98, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph99
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.lr.ph.prol ], [ %indvars.iv135, %.lr.ph.prol.preheader ]
  %.396.prol = phi double [ %104, %.lr.ph.prol ], [ %97, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv133.prol
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %3, i64 %indvars.iv133.prol
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fsub double %.396.prol, %103
  %indvars.iv.next134.prol = add nsw i64 %indvars.iv133.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv133.unr = phi i64 [ %indvars.iv135, %.lr.ph.preheader ], [ %indvars.iv.next134.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.396.unr = phi double [ %97, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %104, %.lr.ph.prol.loopexit.loopexit ]
  %105 = icmp ult i32 %95, 3
  br i1 %105, label %._crit_edge, label %.lr.ph.preheader194

.lr.ph.preheader194:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader194, %.lr.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134.3, %.lr.ph ], [ %indvars.iv133.unr, %.lr.ph.preheader194 ]
  %.396 = phi double [ %129, %.lr.ph ], [ %.396.unr, %.lr.ph.preheader194 ]
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv133
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %3, i64 %indvars.iv133
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %.396, %110
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, 1
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %111, %116
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134.1
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134.1
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next134.2
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next134.2
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fsub double %123, %128
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next134.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph99
  %.3.lcssa = phi double [ %97, %.lr.ph99 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %129, %._crit_edge.loopexit ]
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next136, i64 %indvars.iv.next136
  %131 = load double, double* %130, align 8
  %132 = fdiv double %.3.lcssa, %131
  %133 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next136
  store double %132, double* %133, align 8
  %134 = icmp sgt i64 %indvars.iv135, 1
  %indvar.next = add i32 %indvar, 1
  br i1 %134, label %.lr.ph99, label %._crit_edge100.loopexit

._crit_edge100.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %5, %.preheader93, %.preheader
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

; <label>:13:                                     ; preds = %.lr.ph, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
