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
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(i32 2000, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
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
  br i1 %7, label %.lr.ph110.preheader, label %._crit_edge107.thread

.lr.ph110.preheader:                              ; preds = %5
  %xtraiter181 = and i32 %0, 1
  %lcmp.mod182 = icmp eq i32 %xtraiter181, 0
  br i1 %lcmp.mod182, label %.lr.ph110.prol.loopexit, label %.lr.ph110.prol

.lr.ph110.prol:                                   ; preds = %.lr.ph110.preheader
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %8 = fdiv double 1.000000e+00, %6
  %9 = fmul double %8, 5.000000e-01
  %10 = fadd double %9, 4.000000e+00
  store double %10, double* %2, align 8
  br label %.lr.ph110.prol.loopexit

.lr.ph110.prol.loopexit:                          ; preds = %.lr.ph110.preheader, %.lr.ph110.prol
  %indvars.iv178.unr = phi i64 [ 0, %.lr.ph110.preheader ], [ 1, %.lr.ph110.prol ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader84.preheader, label %.lr.ph110.preheader190

.lr.ph110.preheader190:                           ; preds = %.lr.ph110.prol.loopexit
  %wide.trip.count180.1 = zext i32 %0 to i64
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph110

.preheader85:                                     ; preds = %.lr.ph110
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.preheader84.preheader, label %._crit_edge107.thread

.preheader84.preheader:                           ; preds = %.lr.ph110.prol.loopexit, %.preheader85
  %15 = add i32 %0, -2
  %16 = zext i32 %15 to i64
  %17 = sext i32 %0 to i64
  %wide.trip.count176 = zext i32 %0 to i64
  br label %.lr.ph100

.lr.ph110:                                        ; preds = %.lr.ph110.preheader190, %.lr.ph110
  %indvars.iv178 = phi i64 [ %indvars.iv.next179.1, %.lr.ph110 ], [ %indvars.iv178.unr, %.lr.ph110.preheader190 ]
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv178
  %19 = bitcast double* %18 to <2 x double>*
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv178
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %22 = trunc i64 %indvars.iv.next179 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv178
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %indvars.iv.next179.1 = add nsw i64 %indvars.iv178, 2
  %25 = trunc i64 %indvars.iv.next179.1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %13
  %30 = fmul <2 x double> %29, <double 5.000000e-01, double 5.000000e-01>
  %31 = fadd <2 x double> %30, <double 4.000000e+00, double 4.000000e+00>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %exitcond.1184 = icmp eq i64 %indvars.iv.next179.1, %wide.trip.count180.1
  br i1 %exitcond.1184, label %.preheader85, label %.lr.ph110

.lr.ph100:                                        ; preds = %.preheader84.preheader, %._crit_edge105
  %indvars.iv173 = phi i64 [ 0, %.preheader84.preheader ], [ %indvars.iv.next174, %._crit_edge105 ]
  %indvars.iv171 = phi i64 [ 1, %.preheader84.preheader ], [ %indvars.iv.next172, %._crit_edge105 ]
  %33 = mul nuw nsw i64 %indvars.iv173, 2001
  %34 = add nuw nsw i64 %33, 1
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %34
  %35 = sub i64 %16, %indvars.iv173
  %36 = shl i64 %35, 3
  %37 = and i64 %36, 34359738360
  %38 = add nuw nsw i64 %37, 8
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph100
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %39 ], [ 0, %.lr.ph100 ]
  %40 = sub nsw i64 0, %indvars.iv155
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, %0
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, %6
  %45 = fadd double %44, 1.000000e+00
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv173, i64 %indvars.iv155
  store double %45, double* %46, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next156, %indvars.iv171
  br i1 %exitcond163, label %._crit_edge101, label %39

._crit_edge101:                                   ; preds = %39
  %indvars.iv.next174 = add nuw nsw i64 %indvars.iv173, 1
  %47 = icmp slt i64 %indvars.iv.next174, %17
  br i1 %47, label %._crit_edge105.loopexit, label %._crit_edge105

._crit_edge105.loopexit:                          ; preds = %._crit_edge101
  %48 = bitcast double* %scevgep169 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %48, i8 0, i64 %38, i32 8, i1 false)
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit, %._crit_edge101
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv173, i64 %indvars.iv173
  store double 1.000000e+00, double* %49, align 8
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next174, %wide.trip.count176
  br i1 %exitcond177, label %._crit_edge107, label %.lr.ph100

._crit_edge107.thread:                            ; preds = %.preheader85, %5
  %50 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge88

._crit_edge107:                                   ; preds = %._crit_edge105
  %51 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %52 = icmp sgt i32 %0, 0
  br i1 %52, label %.preheader83.us.preheader, label %._crit_edge88

.preheader83.us.preheader:                        ; preds = %._crit_edge107
  %53 = add i32 %0, -1
  %54 = zext i32 %53 to i64
  %55 = shl nuw nsw i64 %54, 3
  %56 = add nuw nsw i64 %55, 8
  %xtraiter149 = and i32 %0, 3
  %lcmp.mod150 = icmp eq i32 %xtraiter149, 0
  br i1 %lcmp.mod150, label %.preheader83.us.prol.loopexit, label %._crit_edge97.us.prol.preheader

._crit_edge97.us.prol.preheader:                  ; preds = %.preheader83.us.preheader
  br label %._crit_edge97.us.prol

._crit_edge97.us.prol:                            ; preds = %._crit_edge97.us.prol.preheader, %._crit_edge97.us.prol
  %indvars.iv146.prol = phi i64 [ %indvars.iv.next147.prol, %._crit_edge97.us.prol ], [ 0, %._crit_edge97.us.prol.preheader ]
  %prol.iter152 = phi i32 [ %prol.iter152.sub, %._crit_edge97.us.prol ], [ %xtraiter149, %._crit_edge97.us.prol.preheader ]
  %57 = mul nuw nsw i64 %indvars.iv146.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %51, i64 %57
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next147.prol = add nuw nsw i64 %indvars.iv146.prol, 1
  %prol.iter152.sub = add i32 %prol.iter152, -1
  %prol.iter152.cmp = icmp eq i32 %prol.iter152.sub, 0
  br i1 %prol.iter152.cmp, label %.preheader83.us.prol.loopexit.loopexit, label %._crit_edge97.us.prol, !llvm.loop !1

.preheader83.us.prol.loopexit.loopexit:           ; preds = %._crit_edge97.us.prol
  br label %.preheader83.us.prol.loopexit

.preheader83.us.prol.loopexit:                    ; preds = %.preheader83.us.prol.loopexit.loopexit, %.preheader83.us.preheader
  %indvars.iv146.unr = phi i64 [ 0, %.preheader83.us.preheader ], [ %indvars.iv.next147.prol, %.preheader83.us.prol.loopexit.loopexit ]
  %58 = icmp ult i32 %53, 3
  br i1 %58, label %.preheader81.lr.ph, label %._crit_edge97.us.3.preheader

._crit_edge97.us.3.preheader:                     ; preds = %.preheader83.us.prol.loopexit
  %wide.trip.count148.3 = zext i32 %0 to i64
  %59 = add nsw i64 %wide.trip.count148.3, -4
  %60 = sub i64 %59, %indvars.iv146.unr
  %61 = lshr i64 %60, 2
  %62 = and i64 %61, 1
  %lcmp.mod = icmp eq i64 %62, 0
  br i1 %lcmp.mod, label %._crit_edge97.us.3.prol.preheader, label %._crit_edge97.us.3.prol.loopexit

._crit_edge97.us.3.prol.preheader:                ; preds = %._crit_edge97.us.3.preheader
  br label %._crit_edge97.us.3.prol

._crit_edge97.us.3.prol:                          ; preds = %._crit_edge97.us.3.prol.preheader
  %63 = mul nuw nsw i64 %indvars.iv146.unr, 16000
  %scevgep.prol196 = getelementptr i8, i8* %51, i64 %63
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol196, i8 0, i64 %56, i32 8, i1 false)
  %64 = mul i64 %indvars.iv146.unr, 16000
  %65 = add i64 %64, 16000
  %scevgep.1.prol = getelementptr i8, i8* %51, i64 %65
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %56, i32 8, i1 false)
  %66 = mul i64 %indvars.iv146.unr, 16000
  %67 = add i64 %66, 32000
  %scevgep.2.prol = getelementptr i8, i8* %51, i64 %67
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %56, i32 8, i1 false)
  %68 = mul i64 %indvars.iv146.unr, 16000
  %69 = add i64 %68, 48000
  %scevgep.3.prol = getelementptr i8, i8* %51, i64 %69
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next147.3.prol = add nsw i64 %indvars.iv146.unr, 4
  br label %._crit_edge97.us.3.prol.loopexit

._crit_edge97.us.3.prol.loopexit:                 ; preds = %._crit_edge97.us.3.prol, %._crit_edge97.us.3.preheader
  %indvars.iv146.unr197 = phi i64 [ %indvars.iv146.unr, %._crit_edge97.us.3.preheader ], [ %indvars.iv.next147.3.prol, %._crit_edge97.us.3.prol ]
  %70 = icmp eq i64 %61, 0
  br i1 %70, label %.preheader82, label %._crit_edge97.us.3.preheader.new

._crit_edge97.us.3.preheader.new:                 ; preds = %._crit_edge97.us.3.prol.loopexit
  br label %._crit_edge97.us.3

.preheader82.unr-lcssa:                           ; preds = %._crit_edge97.us.3
  br label %.preheader82

.preheader82:                                     ; preds = %._crit_edge97.us.3.prol.loopexit, %.preheader82.unr-lcssa
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.preheader81.lr.ph, label %._crit_edge88

.preheader81.lr.ph:                               ; preds = %.preheader83.us.prol.loopexit, %.preheader82
  %xtraiter130 = and i32 %0, 1
  %wide.trip.count136 = zext i32 %0 to i64
  %wide.trip.count127.1 = zext i32 %0 to i64
  %wide.trip.count141 = zext i32 %0 to i64
  %72 = icmp eq i32 %xtraiter130, 0
  %73 = icmp eq i32 %0, 1
  %74 = bitcast i8* %51 to [2000 x [2000 x double]]*
  %75 = bitcast i8* %51 to [2000 x [2000 x double]]*
  %sunkaddr = ptrtoint [2000 x double]* %1 to i64
  br label %.preheader80.us.us.preheader

.preheader80.us.us.preheader:                     ; preds = %.preheader81.lr.ph, %._crit_edge93.us
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge93.us ], [ 0, %.preheader81.lr.ph ]
  %sunkaddr191 = shl i64 %indvars.iv138, 3
  %sunkaddr192 = add i64 %sunkaddr, %sunkaddr191
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to double*
  br label %.preheader80.us.us

._crit_edge93.us:                                 ; preds = %._crit_edge91.us.us
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next139, %wide.trip.count141
  br i1 %exitcond142, label %.preheader79, label %.preheader80.us.us.preheader

.preheader80.us.us:                               ; preds = %._crit_edge91.us.us, %.preheader80.us.us.preheader
  %indvars.iv133 = phi i64 [ 0, %.preheader80.us.us.preheader ], [ %indvars.iv.next134, %._crit_edge91.us.us ]
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv133, i64 %indvars.iv138
  br i1 %72, label %.prol.loopexit129, label %.prol.preheader128

.prol.preheader128:                               ; preds = %.preheader80.us.us
  %77 = load double, double* %76, align 8
  %78 = load double, double* %sunkaddr193, align 8
  %79 = fmul double %77, %78
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv133, i64 0
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  store double %82, double* %80, align 8
  br label %.prol.loopexit129

.prol.loopexit129:                                ; preds = %.prol.preheader128, %.preheader80.us.us
  %indvars.iv125.unr.ph = phi i64 [ 1, %.prol.preheader128 ], [ 0, %.preheader80.us.us ]
  br i1 %73, label %._crit_edge91.us.us, label %.preheader80.us.us.new.preheader

.preheader80.us.us.new.preheader:                 ; preds = %.prol.loopexit129
  br label %.preheader80.us.us.new

._crit_edge91.us.us.loopexit:                     ; preds = %.preheader80.us.us.new
  br label %._crit_edge91.us.us

._crit_edge91.us.us:                              ; preds = %._crit_edge91.us.us.loopexit, %.prol.loopexit129
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next134, %wide.trip.count136
  br i1 %exitcond137, label %._crit_edge93.us, label %.preheader80.us.us

.preheader80.us.us.new:                           ; preds = %.preheader80.us.us.new.preheader, %.preheader80.us.us.new
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %.preheader80.us.us.new ], [ %indvars.iv125.unr.ph, %.preheader80.us.us.new.preheader ]
  %83 = load double, double* %76, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125, i64 %indvars.iv138
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv133, i64 %indvars.iv125
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %90 = load double, double* %76, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next126, i64 %indvars.iv138
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv133, i64 %indvars.iv.next126
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next126.1, %wide.trip.count127.1
  br i1 %exitcond.1, label %._crit_edge91.us.us.loopexit, label %.preheader80.us.us.new

.preheader79:                                     ; preds = %._crit_edge93.us
  %97 = icmp sgt i32 %0, 0
  br i1 %97, label %.preheader.us.preheader, label %._crit_edge88

.preheader.us.preheader:                          ; preds = %.preheader79
  %98 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %wide.trip.count123 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  %99 = icmp eq i32 %xtraiter, 0
  %100 = icmp ult i32 %98, 3
  %101 = bitcast i8* %51 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %51 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next121, %._crit_edge.us ]
  br i1 %99, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv120, i64 %indvars.iv.prol
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.prol
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %100, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv120, i64 %indvars.iv
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next121, %wide.trip.count123
  br i1 %exitcond124, label %._crit_edge88.loopexit, label %.preheader.us

._crit_edge88.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88.loopexit, %._crit_edge107, %._crit_edge107.thread, %.preheader82, %.preheader79
  %128 = phi i8* [ %51, %.preheader79 ], [ %51, %.preheader82 ], [ %51, %._crit_edge107 ], [ %50, %._crit_edge107.thread ], [ %51, %._crit_edge88.loopexit ]
  tail call void @free(i8* %128) #4
  ret void

._crit_edge97.us.3:                               ; preds = %._crit_edge97.us.3, %._crit_edge97.us.3.preheader.new
  %indvars.iv146 = phi i64 [ %indvars.iv146.unr197, %._crit_edge97.us.3.preheader.new ], [ %indvars.iv.next147.3.1, %._crit_edge97.us.3 ]
  %129 = mul nuw nsw i64 %indvars.iv146, 16000
  %scevgep = getelementptr i8, i8* %51, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %56, i32 8, i1 false)
  %130 = mul i64 %indvars.iv146, 16000
  %131 = add i64 %130, 16000
  %scevgep.1 = getelementptr i8, i8* %51, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %56, i32 8, i1 false)
  %132 = mul i64 %indvars.iv146, 16000
  %133 = add i64 %132, 32000
  %scevgep.2 = getelementptr i8, i8* %51, i64 %133
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %56, i32 8, i1 false)
  %134 = mul i64 %indvars.iv146, 16000
  %135 = add i64 %134, 48000
  %scevgep.3 = getelementptr i8, i8* %51, i64 %135
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next147.3 = add nsw i64 %indvars.iv146, 4
  %136 = mul nuw nsw i64 %indvars.iv.next147.3, 16000
  %scevgep.1198 = getelementptr i8, i8* %51, i64 %136
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1198, i8 0, i64 %56, i32 8, i1 false)
  %137 = mul i64 %indvars.iv.next147.3, 16000
  %138 = add i64 %137, 16000
  %scevgep.1.1 = getelementptr i8, i8* %51, i64 %138
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %56, i32 8, i1 false)
  %139 = mul i64 %indvars.iv.next147.3, 16000
  %140 = add i64 %139, 32000
  %scevgep.2.1 = getelementptr i8, i8* %51, i64 %140
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %56, i32 8, i1 false)
  %141 = mul i64 %indvars.iv.next147.3, 16000
  %142 = add i64 %141, 48000
  %scevgep.3.1 = getelementptr i8, i8* %51, i64 %142
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %56, i32 8, i1 false)
  %indvars.iv.next147.3.1 = add nsw i64 %indvars.iv146, 8
  %exitcond.3154.1 = icmp eq i64 %indvars.iv.next147.3.1, %wide.trip.count148.3
  br i1 %exitcond.3154.1, label %.preheader82.unr-lcssa, label %._crit_edge97.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader95.preheader, label %._crit_edge100

.preheader95.preheader:                           ; preds = %5
  %wide.trip.count181 = zext i32 %0 to i64
  %wide.trip.count188 = zext i32 %0 to i64
  br label %.preheader95

.preheader95:                                     ; preds = %.preheader95.preheader, %._crit_edge125
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge125 ], [ 0, %.preheader95.preheader ]
  %7 = add i64 %indvars.iv185, 4294967295
  %8 = icmp sgt i64 %indvars.iv185, 0
  br i1 %8, label %.lr.ph116.preheader, label %._crit_edge125

.lr.ph116.preheader:                              ; preds = %.preheader95
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 0
  br label %.lr.ph116

.preheader93:                                     ; preds = %._crit_edge125
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.lr.ph108.preheader, label %._crit_edge100

.lr.ph108.preheader:                              ; preds = %.preheader93
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph108

.lr.ph124:                                        ; preds = %._crit_edge113
  %11 = icmp sgt i64 %indvars.iv185, 0
  br i1 %11, label %.lr.ph124.split.us.preheader, label %._crit_edge125

.lr.ph124.split.us.preheader:                     ; preds = %.lr.ph124
  %xtraiter172190 = and i64 %indvars.iv185, 1
  %12 = trunc i64 %7 to i32
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 0
  %14 = icmp eq i64 %xtraiter172190, 0
  %15 = icmp eq i32 %12, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %.lr.ph124.split.us.preheader, %._crit_edge121.us
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge121.us ], [ %indvars.iv185, %.lr.ph124.split.us.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv178
  %17 = load double, double* %16, align 8
  br i1 %14, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv178
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %17, %21
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph124.split.us
  %indvars.iv167.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph124.split.us ]
  %.1118.us.unr.ph = phi double [ %22, %.prol.preheader ], [ %17, %.lr.ph124.split.us ]
  %.lcssa130.unr.ph = phi double [ %22, %.prol.preheader ], [ undef, %.lr.ph124.split.us ]
  br i1 %15, label %._crit_edge121.us, label %.lr.ph124.split.us.new.preheader

.lr.ph124.split.us.new.preheader:                 ; preds = %.prol.loopexit
  br label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.lr.ph124.split.us.new.preheader, %.lr.ph124.split.us.new
  %indvars.iv167 = phi i64 [ %indvars.iv.next168.1, %.lr.ph124.split.us.new ], [ %indvars.iv167.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %.1118.us = phi double [ %36, %.lr.ph124.split.us.new ], [ %.1118.us.unr.ph, %.lr.ph124.split.us.new.preheader ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv167
  %24 = bitcast double* %23 to <2 x double>*
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv167, i64 %indvars.iv178
  %26 = load double, double* %25, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %27 = load <2 x double>, <2 x double>* %24, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next168, i64 %indvars.iv178
  %29 = load double, double* %28, align 8
  %30 = insertelement <2 x double> undef, double %26, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fmul <2 x double> %27, %31
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fsub double %.1118.us, %33
  %36 = fsub double %35, %34
  %indvars.iv.next168.1 = add nsw i64 %indvars.iv167, 2
  %exitcond.1175 = icmp eq i64 %indvars.iv.next168.1, %indvars.iv185
  br i1 %exitcond.1175, label %._crit_edge121.us.loopexit, label %.lr.ph124.split.us.new

._crit_edge121.us.loopexit:                       ; preds = %.lr.ph124.split.us.new
  br label %._crit_edge121.us

._crit_edge121.us:                                ; preds = %._crit_edge121.us.loopexit, %.prol.loopexit
  %.lcssa130 = phi double [ %.lcssa130.unr.ph, %.prol.loopexit ], [ %36, %._crit_edge121.us.loopexit ]
  store double %.lcssa130, double* %16, align 8
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next179, %wide.trip.count181
  br i1 %exitcond182, label %._crit_edge125.loopexit, label %.lr.ph124.split.us

.lr.ph116:                                        ; preds = %.lr.ph116.preheader, %._crit_edge113
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge113 ], [ 0, %.lr.ph116.preheader ]
  %37 = add i64 %indvars.iv158, 4294967295
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv158
  %39 = load double, double* %38, align 8
  %40 = icmp sgt i64 %indvars.iv158, 0
  br i1 %40, label %.lr.ph112.preheader, label %._crit_edge113

.lr.ph112.preheader:                              ; preds = %.lr.ph116
  %xtraiter153191 = and i64 %indvars.iv158, 1
  %lcmp.mod154 = icmp eq i64 %xtraiter153191, 0
  br i1 %lcmp.mod154, label %.lr.ph112.prol.loopexit, label %.lr.ph112.prol

.lr.ph112.prol:                                   ; preds = %.lr.ph112.preheader
  %41 = load double, double* %9, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv158
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  br label %.lr.ph112.prol.loopexit

.lr.ph112.prol.loopexit:                          ; preds = %.lr.ph112.prol, %.lr.ph112.preheader
  %indvars.iv148.unr.ph = phi i64 [ 1, %.lr.ph112.prol ], [ 0, %.lr.ph112.preheader ]
  %.0110.unr.ph = phi double [ %45, %.lr.ph112.prol ], [ %39, %.lr.ph112.preheader ]
  %.lcssa129.unr.ph = phi double [ %45, %.lr.ph112.prol ], [ undef, %.lr.ph112.preheader ]
  %46 = trunc i64 %37 to i32
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %._crit_edge113, label %.lr.ph112.preheader214

.lr.ph112.preheader214:                           ; preds = %.lr.ph112.prol.loopexit
  br label %.lr.ph112

.lr.ph112:                                        ; preds = %.lr.ph112.preheader214, %.lr.ph112
  %indvars.iv148 = phi i64 [ %indvars.iv.next149.1, %.lr.ph112 ], [ %indvars.iv148.unr.ph, %.lr.ph112.preheader214 ]
  %.0110 = phi double [ %61, %.lr.ph112 ], [ %.0110.unr.ph, %.lr.ph112.preheader214 ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv185, i64 %indvars.iv148
  %49 = bitcast double* %48 to <2 x double>*
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv148, i64 %indvars.iv158
  %51 = load double, double* %50, align 8
  %indvars.iv.next149 = add nuw nsw i64 %indvars.iv148, 1
  %52 = load <2 x double>, <2 x double>* %49, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next149, i64 %indvars.iv158
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fmul <2 x double> %52, %56
  %58 = extractelement <2 x double> %57, i32 0
  %59 = extractelement <2 x double> %57, i32 1
  %60 = fsub double %.0110, %58
  %61 = fsub double %60, %59
  %indvars.iv.next149.1 = add nsw i64 %indvars.iv148, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next149.1, %indvars.iv158
  br i1 %exitcond.1, label %._crit_edge113.loopexit, label %.lr.ph112

._crit_edge113.loopexit:                          ; preds = %.lr.ph112
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.lr.ph112.prol.loopexit, %.lr.ph116
  %.0.lcssa = phi double [ %39, %.lr.ph116 ], [ %.lcssa129.unr.ph, %.lr.ph112.prol.loopexit ], [ %61, %._crit_edge113.loopexit ]
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv158
  %63 = load double, double* %62, align 8
  %64 = fdiv double %.0.lcssa, %63
  store double %64, double* %38, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next159, %indvars.iv185
  br i1 %exitcond166, label %.lr.ph124, label %.lr.ph116

._crit_edge125.loopexit:                          ; preds = %._crit_edge121.us
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit, %.preheader95, %.lr.ph124
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond189 = icmp eq i64 %indvars.iv.next186, %wide.trip.count188
  br i1 %exitcond189, label %.preheader93, label %.preheader95

.preheader:                                       ; preds = %._crit_edge105
  %65 = icmp sgt i32 %0, 0
  br i1 %65, label %.lr.ph99.preheader, label %._crit_edge100

.lr.ph99.preheader:                               ; preds = %.preheader
  %66 = sext i32 %0 to i64
  %67 = sext i32 %0 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph99

.lr.ph108:                                        ; preds = %.lr.ph108.preheader, %._crit_edge105
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge105 ], [ 0, %.lr.ph108.preheader ]
  %68 = add i64 %indvars.iv144, 4294967295
  %69 = getelementptr inbounds double, double* %2, i64 %indvars.iv144
  %70 = load double, double* %69, align 8
  %71 = icmp sgt i64 %indvars.iv144, 0
  br i1 %71, label %.lr.ph104.preheader, label %._crit_edge105

.lr.ph104.preheader:                              ; preds = %.lr.ph108
  %72 = trunc i64 %indvars.iv144 to i32
  %xtraiter137 = and i32 %72, 3
  %lcmp.mod138 = icmp eq i32 %xtraiter137, 0
  br i1 %lcmp.mod138, label %.lr.ph104.prol.loopexit, label %.lr.ph104.prol.preheader

.lr.ph104.prol.preheader:                         ; preds = %.lr.ph104.preheader
  br label %.lr.ph104.prol

.lr.ph104.prol:                                   ; preds = %.lr.ph104.prol.preheader, %.lr.ph104.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph104.prol ], [ 0, %.lr.ph104.prol.preheader ]
  %.2102.prol = phi double [ %78, %.lr.ph104.prol ], [ %70, %.lr.ph104.prol.preheader ]
  %prol.iter140 = phi i32 [ %prol.iter140.sub, %.lr.ph104.prol ], [ %xtraiter137, %.lr.ph104.prol.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv.prol
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fsub double %.2102.prol, %77
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter140.sub = add i32 %prol.iter140, -1
  %prol.iter140.cmp = icmp eq i32 %prol.iter140.sub, 0
  br i1 %prol.iter140.cmp, label %.lr.ph104.prol.loopexit.loopexit, label %.lr.ph104.prol, !llvm.loop !4

.lr.ph104.prol.loopexit.loopexit:                 ; preds = %.lr.ph104.prol
  br label %.lr.ph104.prol.loopexit

.lr.ph104.prol.loopexit:                          ; preds = %.lr.ph104.prol.loopexit.loopexit, %.lr.ph104.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph104.preheader ], [ %indvars.iv.next.prol, %.lr.ph104.prol.loopexit.loopexit ]
  %.2102.unr = phi double [ %70, %.lr.ph104.preheader ], [ %78, %.lr.ph104.prol.loopexit.loopexit ]
  %.lcssa128.unr = phi double [ undef, %.lr.ph104.preheader ], [ %78, %.lr.ph104.prol.loopexit.loopexit ]
  %79 = trunc i64 %68 to i32
  %80 = icmp ult i32 %79, 3
  br i1 %80, label %._crit_edge105, label %.lr.ph104.preheader213

.lr.ph104.preheader213:                           ; preds = %.lr.ph104.prol.loopexit
  br label %.lr.ph104

.lr.ph104:                                        ; preds = %.lr.ph104.preheader213, %.lr.ph104
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph104 ], [ %indvars.iv.unr, %.lr.ph104.preheader213 ]
  %.2102 = phi double [ %102, %.lr.ph104 ], [ %.2102.unr, %.lr.ph104.preheader213 ]
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv
  %82 = bitcast double* %81 to <2 x double>*
  %83 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %84 = bitcast double* %83 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %82, align 8
  %86 = load <2 x double>, <2 x double>* %84, align 8
  %87 = fmul <2 x double> %85, %86
  %88 = extractelement <2 x double> %87, i32 0
  %89 = extractelement <2 x double> %87, i32 1
  %90 = fsub double %.2102, %88
  %91 = fsub double %90, %89
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv.next.1
  %93 = bitcast double* %92 to <2 x double>*
  %94 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to <2 x double>*
  %96 = load <2 x double>, <2 x double>* %93, align 8
  %97 = load <2 x double>, <2 x double>* %95, align 8
  %98 = fmul <2 x double> %96, %97
  %99 = extractelement <2 x double> %98, i32 0
  %100 = extractelement <2 x double> %98, i32 1
  %101 = fsub double %91, %99
  %102 = fsub double %101, %100
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3141 = icmp eq i64 %indvars.iv.next.3, %indvars.iv144
  br i1 %exitcond.3141, label %._crit_edge105.loopexit, label %.lr.ph104

._crit_edge105.loopexit:                          ; preds = %.lr.ph104
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.loopexit, %.lr.ph104.prol.loopexit, %.lr.ph108
  %.2.lcssa = phi double [ %70, %.lr.ph108 ], [ %.lcssa128.unr, %.lr.ph104.prol.loopexit ], [ %102, %._crit_edge105.loopexit ]
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv144
  store double %.2.lcssa, double* %103, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next145, %wide.trip.count
  br i1 %exitcond147, label %.preheader, label %.lr.ph108

.lr.ph99:                                         ; preds = %.lr.ph99.preheader, %._crit_edge
  %indvars.iv133 = phi i64 [ %66, %.lr.ph99.preheader ], [ %indvars.iv.next134, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph99.preheader ], [ %indvar.next, %._crit_edge ]
  %104 = add nsw i32 %indvar, -1
  %indvars.iv.next134 = add nsw i64 %indvars.iv133, -1
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next134
  %106 = load double, double* %105, align 8
  %107 = icmp slt i64 %indvars.iv133, %67
  br i1 %107, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph99
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv131.prol = phi i64 [ %indvars.iv.next132.prol, %.lr.ph.prol ], [ %indvars.iv133, %.lr.ph.prol.preheader ]
  %.396.prol = phi double [ %113, %.lr.ph.prol ], [ %106, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next134, i64 %indvars.iv131.prol
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds double, double* %3, i64 %indvars.iv131.prol
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fsub double %.396.prol, %112
  %indvars.iv.next132.prol = add nsw i64 %indvars.iv131.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !5

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv131.unr = phi i64 [ %indvars.iv133, %.lr.ph.preheader ], [ %indvars.iv.next132.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.396.unr = phi double [ %106, %.lr.ph.preheader ], [ %113, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %113, %.lr.ph.prol.loopexit.loopexit ]
  %114 = icmp ult i32 %104, 3
  br i1 %114, label %._crit_edge, label %.lr.ph.preheader212

.lr.ph.preheader212:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader212, %.lr.ph
  %indvars.iv131 = phi i64 [ %indvars.iv.next132.3, %.lr.ph ], [ %indvars.iv131.unr, %.lr.ph.preheader212 ]
  %.396 = phi double [ %136, %.lr.ph ], [ %.396.unr, %.lr.ph.preheader212 ]
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next134, i64 %indvars.iv131
  %116 = bitcast double* %115 to <2 x double>*
  %117 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  %118 = bitcast double* %117 to <2 x double>*
  %119 = load <2 x double>, <2 x double>* %116, align 8
  %120 = load <2 x double>, <2 x double>* %118, align 8
  %121 = fmul <2 x double> %119, %120
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fsub double %.396, %122
  %125 = fsub double %124, %123
  %indvars.iv.next132.1 = add nsw i64 %indvars.iv131, 2
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next134, i64 %indvars.iv.next132.1
  %127 = bitcast double* %126 to <2 x double>*
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next132.1
  %129 = bitcast double* %128 to <2 x double>*
  %130 = load <2 x double>, <2 x double>* %127, align 8
  %131 = load <2 x double>, <2 x double>* %129, align 8
  %132 = fmul <2 x double> %130, %131
  %133 = extractelement <2 x double> %132, i32 0
  %134 = extractelement <2 x double> %132, i32 1
  %135 = fsub double %125, %133
  %136 = fsub double %135, %134
  %indvars.iv.next132.3 = add nsw i64 %indvars.iv131, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next132.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.lr.ph99
  %.3.lcssa = phi double [ %106, %.lr.ph99 ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %136, %._crit_edge.loopexit ]
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next134, i64 %indvars.iv.next134
  %138 = load double, double* %137, align 8
  %139 = fdiv double %.3.lcssa, %138
  %sunkaddr208 = shl i64 %indvars.iv133, 3
  %sunkaddr209 = add i64 %sunkaddr, %sunkaddr208
  %sunkaddr210 = add i64 %sunkaddr209, -8
  %sunkaddr211 = inttoptr i64 %sunkaddr210 to double*
  store double %139, double* %sunkaddr211, align 8
  %140 = icmp sgt i64 %indvars.iv133, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %140, label %.lr.ph99, label %._crit_edge100.loopexit

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
  %wide.trip.count6 = zext i32 %0 to i64
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
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, %wide.trip.count6
  br i1 %exitcond7, label %._crit_edge.loopexit, label %.lr.ph

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
