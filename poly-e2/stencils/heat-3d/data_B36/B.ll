; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %entry, %for.inc22
  %indvars.iv2230 = phi i64 [ %indvars.iv.next23, %for.inc22 ], [ 0, %entry ]
  %0 = add nuw nsw i64 %indvars.iv2230, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc19
  %indvars.iv1727 = phi i64 [ %indvars.iv.next18, %for.inc19 ], [ 0, %for.cond4.preheader.preheader ]
  %1 = add i64 %0, %indvars.iv1727
  br label %for.inc

for.inc:                                          ; preds = %for.cond4.preheader, %for.inc
  %indvars.iv25 = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = sub i64 %1, %indvars.iv25
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv25
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv25, 1
  %4 = sub i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2230, i64 %indvars.iv1727, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1727, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next18, 120
  br i1 %exitcond21, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2230, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond, label %for.end24, label %for.cond4.preheader.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %storemerge144 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc98
  %indvars.iv108134 = phi i64 [ %indvars.iv.next109, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvars.iv108134, 1
  %1 = add nsw i64 %indvars.iv108134, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond4.preheader, %for.inc95
  %indvars.iv102131 = phi i64 [ %indvars.iv.next103, %for.inc95 ], [ 1, %for.cond4.preheader ]
  %2 = add nuw nsw i64 %indvars.iv102131, 1
  %3 = add nsw i64 %indvars.iv102131, -1
  br label %for.inc

for.inc:                                          ; preds = %for.cond8.preheader, %for.inc
  %indvars.iv129 = phi i64 [ 1, %for.cond8.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv102131, i64 %indvars.iv129
  %4 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv129
  %5 = load double, double* %arrayidx21, align 8
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv102131, i64 %indvars.iv129
  %6 = load double, double* %arrayidx29, align 8
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %2, i64 %indvars.iv129
  %7 = load double, double* %arrayidx38, align 8
  %8 = insertelement <2 x double> undef, double %5, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %mul = fmul <2 x double> %mul.v.i1.2, <double 2.000000e+00, double 2.000000e+00>
  %sub22.v.i0.1 = insertelement <2 x double> undef, double %4, i32 0
  %sub22.v.i0.2 = insertelement <2 x double> %sub22.v.i0.1, double %7, i32 1
  %sub22 = fsub <2 x double> %sub22.v.i0.2, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %3, i64 %indvars.iv129
  %9 = load double, double* %arrayidx53, align 8
  %add30.v.i1.1 = insertelement <2 x double> undef, double %6, i32 0
  %add30.v.i1.2 = insertelement <2 x double> %add30.v.i1.1, double %9, i32 1
  %add30 = fadd <2 x double> %sub22, %add30.v.i1.2
  %mul31 = fmul <2 x double> %add30, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1 = extractelement <2 x double> %mul31, i32 0
  %mul31.v.r2 = extractelement <2 x double> %mul31, i32 1
  %add56 = fadd double %mul31.v.r1, %mul31.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv129, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx63, align 8
  %mul70 = fmul double %5, 2.000000e+00
  %sub71 = fsub double %10, %mul70
  %11 = add nsw i64 %indvars.iv129, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %11
  %12 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %12
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %mul80, %add56
  %add88 = fadd double %5, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv108134, i64 %indvars.iv102131, i64 %indvars.iv129
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95, label %for.inc

for.inc95:                                        ; preds = %for.inc
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102131, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next103, 119
  br i1 %exitcond107, label %for.inc98, label %for.cond8.preheader

for.inc98:                                        ; preds = %for.inc95
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108134, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next109, 119
  br i1 %exitcond147, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv123142 = phi i64 [ %indvars.iv.next124, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %13 = add nuw nsw i64 %indvars.iv123142, 1
  %14 = add nsw i64 %indvars.iv123142, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.cond105.preheader, %for.inc203
  %indvars.iv117139 = phi i64 [ %indvars.iv.next118, %for.inc203 ], [ 1, %for.cond105.preheader ]
  %15 = add nuw nsw i64 %indvars.iv117139, 1
  %16 = add nsw i64 %indvars.iv117139, -1
  br label %for.inc200

for.inc200:                                       ; preds = %for.cond109.preheader, %for.inc200
  %indvars.iv112137 = phi i64 [ 1, %for.cond109.preheader ], [ %indvars.iv.next113, %for.inc200 ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %13, i64 %indvars.iv117139, i64 %indvars.iv112137
  %17 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123142, i64 %indvars.iv117139, i64 %indvars.iv112137
  %18 = load double, double* %arrayidx125, align 8
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %14, i64 %indvars.iv117139, i64 %indvars.iv112137
  %19 = load double, double* %arrayidx134, align 8
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123142, i64 %15, i64 %indvars.iv112137
  %20 = load double, double* %arrayidx143, align 8
  %21 = insertelement <2 x double> undef, double %18, i32 0
  %mul126.v.i1.2 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %mul126 = fmul <2 x double> %mul126.v.i1.2, <double 2.000000e+00, double 2.000000e+00>
  %sub127.v.i0.1 = insertelement <2 x double> undef, double %17, i32 0
  %sub127.v.i0.2 = insertelement <2 x double> %sub127.v.i0.1, double %20, i32 1
  %sub127 = fsub <2 x double> %sub127.v.i0.2, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123142, i64 %16, i64 %indvars.iv112137
  %22 = load double, double* %arrayidx158, align 8
  %add135.v.i1.1 = insertelement <2 x double> undef, double %19, i32 0
  %add135.v.i1.2 = insertelement <2 x double> %add135.v.i1.1, double %22, i32 1
  %add135 = fadd <2 x double> %sub127, %add135.v.i1.2
  %mul136 = fmul <2 x double> %add135, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1 = extractelement <2 x double> %mul136, i32 0
  %mul136.v.r2 = extractelement <2 x double> %mul136, i32 1
  %add161 = fadd double %mul136.v.r1, %mul136.v.r2
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112137, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123142, i64 %indvars.iv117139, i64 %indvars.iv.next113
  %23 = load double, double* %arrayidx168, align 8
  %mul175 = fmul double %18, 2.000000e+00
  %sub176 = fsub double %23, %mul175
  %24 = add nsw i64 %indvars.iv112137, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv123142, i64 %indvars.iv117139, i64 %24
  %25 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %25
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %mul185, %add161
  %add193 = fadd double %18, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv123142, i64 %indvars.iv117139, i64 %indvars.iv112137
  store double %add193, double* %arrayidx199, align 8
  %exitcond116 = icmp eq i64 %indvars.iv.next113, 119
  br i1 %exitcond116, label %for.inc203, label %for.inc200

for.inc203:                                       ; preds = %for.inc200
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117139, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next118, 119
  br i1 %exitcond122, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123142, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next124, 119
  br i1 %exitcond148, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %storemerge144, 1
  %exitcond127 = icmp eq i32 %inc210, 501
  br i1 %exitcond127, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond5.preheader.preheader

for.cond5.preheader.preheader:                    ; preds = %entry, %for.inc21
  %indvars.iv1827 = phi i64 [ %indvars.iv.next19, %for.inc21 ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv1827, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc18
  %indvars.iv1424 = phi i64 [ %indvars.iv.next15, %for.inc18 ], [ 0, %for.cond5.preheader.preheader ]
  %mul83 = add i64 %indvars.iv1424, %3
  %add = mul i64 %mul83, 120
  br label %for.body7

for.body7:                                        ; preds = %for.cond5.preheader, %for.inc
  %indvars.iv22 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add i64 %indvars.iv22, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1827, i64 %indvars.iv1424, i64 %indvars.iv22
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1424, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 120
  br i1 %exitcond17, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next19, 120
  br i1 %exitcond55, label %for.end23, label %for.cond5.preheader.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
